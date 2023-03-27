import os

for i in range(50):
    os.system('cp avatar.png avatar_{}.png'.format(i))