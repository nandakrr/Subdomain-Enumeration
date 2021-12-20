#!/bin/bash


GOlang() {
        printf "                                \r"
        sys=$(uname -m)
        LATEST=$(curl -s 'https://go.dev/VERSION?m=text')
        [ $sys == "x86_64" ] && wget https://golang.org/dl/$LATEST.linux-amd64.tar.gz -O golang.tar.gz &>/dev/null || wget https://golang.org/dl/$LATEST.linux-386.tar.>        sudo tar -C /usr/local -xzf golang.tar.gz
        echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
        echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
        echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
        printf "[+] Golang Installed !.\n"
}

Subfinder() {
        printf "                                \r"
        GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &>/dev/null
        printf "[+] Subfinder Installed !.\n"
}


hash go 2>/dev/null && printf "[!] Golang is already installed.\n" || { printf "[+] Installing GOlang!" && GOlang; }

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

hash subfinder 2>/dev/null && printf "[!] subfinder is already installed.\n" || { printf "[+] Installing subfinder!" && Subfinder; }

list=(
        go
        subfinder
        )

r="\e[31m"
g="\e[32m"
e="\e[0m"

for prg in ${list[@]}
do
        hash $prg 2>/dev/null && printf "[$prg]$g Done$e\n" || printf "[$prg]$r Not Installed! Check Again.$e\n"
done
