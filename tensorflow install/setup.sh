#setup cuda+nvidia first

sudo apt-get install libcupti-dev

if [ ! -d "~/code/" ]; then
   sudo mkdir ~/code/
fi

if [ ! -d "~/code/external/" ]; then
   sudo mkdir ~/code/external/
fi

#checkout tensorflow
sudo apt-get install git
cd ~/code/external
sudo git clone https://github.com/tensorflow/tensorflow

#install bazel
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

sudo apt-get update && sudo apt-get install bazel

#setup virtualenv for python3
sudo apt-get install python3-pip python3-dev python-virtualenv
virtualenv --system-site-packages -p python3 targetDirectory


