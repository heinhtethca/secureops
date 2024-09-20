https://hellocloudacademy.slack.com/archives/C05HPMMHXU6/p1724907122569279
https://developer.hashicorp.com/vault/docs/auth
aws - vpc,ec2,rds
hcp - aws secret static role
hcp - aws secret dynamic role
hcp - db secret dynamic role for mysql

create git repo
authenticate to git and clone the repo (with ssh or classic token)
cd $HOME
cd .ssh
ssh-keygen -t rsa -b 4096 -C 
pwd /d/kube-demo/hellocloud-native-box/tf-aws/pj1/
git clone 

pwd /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops/create-hcp-vault-cluster
touch main.tf output.tf variable.tf

#in hcp portal

$ git config credential.helper store

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops/create-hcp-vault-cluster (main)
$ cd ..

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git config credential.helper store

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        create-hcp-vault-cluster/

nothing added to commit but untracked files present (use "git add" to track)

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git add.
git: 'add.' is not a git command. See 'git --help'.

The most similar command is
        add

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git add .

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git commit -m "first commit"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'heinh@DESKTOP-LTQOOO7.(none)')

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git push orgin
fatal: 'orgin' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git push origin
info: please complete authentication in your browser...
Everything up-to-date

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git push origin
Everything up-to-date

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   create-hcp-vault-cluster/main.tf
        new file:   create-hcp-vault-cluster/note.md
        new file:   create-hcp-vault-cluster/output.tf
        new file:   create-hcp-vault-cluster/variable.tf
        new file:   create-hcp-vault-cluster/version.tf


heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git commit -m 
error: switch `m' requires a value

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git commit -m  "first commit"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'heinh@DESKTOP-LTQOOO7.(none)')

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git config user.name "kloudnativestuffs"
git config user.email "kloudnativestuffs@gmail.com"^C

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git config user.name heinhtethca

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git config user.email heinhtet.hca@gmail.com

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git commit -m  "first commit"
[main 4b51708] first commit
 5 files changed, 112 insertions(+)
 create mode 100644 create-hcp-vault-cluster/main.tf
 create mode 100644 create-hcp-vault-cluster/note.md
 create mode 100644 create-hcp-vault-cluster/output.tf
 create mode 100644 create-hcp-vault-cluster/variable.tf
 create mode 100644 create-hcp-vault-cluster/version.tf

heinh@DESKTOP-LTQOOO7 MINGW64 /d/kube-demo/hellocloud-native-box/tf-aws/pj1/secureops (main)
$ git push origin
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 16 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1.49 KiB | 1.49 MiB/s, done.
Total 8 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/heinhtethca/secureops.git
   d113e7c..4b51708  main -> main 