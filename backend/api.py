import os
from flask import Flask, make_response, request, jsonify, send_file
import sqlite3
import hashlib
import datetime
from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token, get_jwt_identity
)
from dotenv import load_dotenv

app = Flask(__name__)

load_dotenv()

app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
app.config['JWT_TOKEN_LOCATION'] = ['headers', 'cookies']
app.config['AVATAR_FOLDER'] = './sql/avatars/'

jwt = JWTManager(app)

DB = 'db.sqlite'


@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    conn = sqlite3.connect(DB)
    cursor = conn.cursor()

    cursor.execute('SELECT * FROM User WHERE email=?', (email,))
    user = cursor.fetchone()

    if user is None:
        return {'message': 'Invalid email or password'}, 401

    user_id, email, name, hashed_password, avatar = user
    password_hash = hashlib.sha256((password).encode()).hexdigest()

    if password_hash != hashed_password:
        return {'message': 'Invalid email or password'}, 401

    token = create_access_token(user_id, expires_delta=datetime.timedelta(days=30))
    
    conn.close()

    return {'message': 1, 'token' : token}, 200

@app.route('/get_user_avatar', methods=['POST'])
@jwt_required()
def get_avatar():
    id = request.get_json()['id']
    current_user_id = get_jwt_identity()
    if current_user_id != id:
        return jsonify({"msg": "Unauthorized access"}), 401

    avatar_filename = f'avatar_{current_user_id}.png'
    avatar_filepath = os.path.join(app.config['AVATAR_FOLDER'], avatar_filename)

    return send_file(avatar_filepath, mimetype='image/png')

if __name__ == '__main__':
    app.run(host='localhost', port=9999, debug=True)
