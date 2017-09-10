ssh-keygen -t rsa -b 4096 -C "mohlin.david@gmail.com" #press enter
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
