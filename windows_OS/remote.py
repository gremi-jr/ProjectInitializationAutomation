import sys
import os
from github import Github

foldername = str(sys.argv[1])
path = os.environ.get('mp')         # add projects dirctory to the env vars
token = os.environ.get('gt')        # add github token to the env vars
_dir = path + '/' + foldername

g = Github(token)
user = g.get_user()
login = user.login

if sys.argv[3] == "private":
    visibility = True
elif sys.argv[3] =="public":
    visibility = False
else:
    print("Choose visibility")


if sys.argv[2] == "g":
    repo = user.create_repo(foldername, private=visibility)
    commands = [f'echo # {repo.name} >> README.md',
                'git init',
                f'git remote add origin https://github.com/{login}/{foldername}.git',
                'git add .',
                'git commit -m "Initial commit"',
                'git push -u origin master']    
    os.mkdir(_dir)
    os.chdir(_dir)

    for c in commands:
        os.system(c)

    print(f'{foldername} created locally')
    os.system('code .')

else:
    print("create <foldername>")



