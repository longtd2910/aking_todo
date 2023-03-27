import sqlite3
import random
import hashlib

# Connect to the database
conn = sqlite3.connect('../db.sqlite')

# Insert data into the User table
for i in range(1, 51):
    email = f'user{i}@example.com'
    name = f'User {i}'
    avatar = f'./avatars/avatar_{i}.png'
    password = hashlib.sha256(str(i).encode()).hexdigest()
    conn.execute("INSERT INTO User (email, name, avatar, password) VALUES (?, ?, ?, ?)",
                 (email, name, avatar, password))

# Insert data into the Project table
colors = ['#ff0000', '#00ff00', '#0000ff', '#ffff00', '#00ffff', '#ff00ff']
for i in range(1, 51):
    title = f'Project {i}'
    color = random.choice(colors)
    is_default = False
    conn.execute("INSERT INTO Project (title, color, is_default) VALUES (?, ?, ?)",
                 (title, color, is_default))

# Insert data into the CheckList table
for i in range(1, 51):
    title = f'CheckList {i}'
    description = f'Description for CheckList {i}'
    color = random.choice(colors)
    project_id = random.randint(1, 50)
    conn.execute("INSERT INTO CheckList (title, description, color, project_id) VALUES (?, ?, ?, ?)",
                 (title, description, color, project_id))

# Insert data into the CheckListItem table
for i in range(1, 51):
    title = f'CheckListItem {i}'
    is_done = random.choice([True, False])
    index = i
    check_list_id = random.randint(1, 50)
    conn.execute("INSERT INTO CheckListItem (title, is_done, `index`, check_list_id) VALUES (?, ?, ?, ?)",
                 (title, is_done, index, check_list_id))

# Insert data into the Note table
for i in range(1, 51):
    description = f'Note {i} description'
    color = random.choice(colors)
    project_id = random.randint(1, 50)
    conn.execute("INSERT INTO Note (description, color, project_id) VALUES (?, ?, ?)",
                 (description, color, project_id))

# Insert data into the Task table
for i in range(1, 51):
    title = f'Task {i}'
    description = f'Task {i} description'
    due_date = f'2023-03-{random.randint(1, 31):02d}'
    project_id = random.randint(1, 50)
    conn.execute("INSERT INTO Task (title, description, due_date, project_id) VALUES (?, ?, ?, ?)",
                 (title, description, due_date, project_id))

# Insert data into the TaskComment table
for i in range(1, 51):
    comment = f'Task {i} comment'
    date = f'2023-03-{random.randint(1, 31):02d} {random.randint(0, 23):02d}:{random.randint(0, 59):02d}'
    user_id = random.randint(1, 50)
    task_id = random.randint(1, 50)
    conn.execute("INSERT INTO TaskComment (task_id, user_id, comment, date) VALUES (?, ?, ?, ?)",
                 (task_id, user_id, comment, date))

# Commit changes and close the connection
conn.commit()
conn.close()
