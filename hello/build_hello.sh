cd ~/Downloads
wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go/bin
sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go

mkdir –p ~/devops-challenge/hello
cd ~/devops-challenge/hello
go get -u
go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"'

