sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y qt4-qmake libqt4-dev build-essential libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libminiupnpc-dev git
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
mkdir $HOME/blackbitcoin
cd $HOME/blackbitcoin
git clone https://github.com/black-bitcoin/BlackBitCoin-master.git
cd BlackBitCoin-master/src/leveldb
chmod +x ./build_detect_platform
cd ../
NPROC=$(nproc)
echo "nproc: $NPROC"
make -f makefile.unix -j$NPROC
strip blackbitcoind
cd $HOME
mkdir $HOME/deps
cd $HOME/deps
wget http://zlib.net/zlib-1.2.8.tar.gz
wget http://download.sourceforge.net/libpng/libpng-1.6.21.tar.gz
tar xvfz zlib-1.2.8.tar.gz
tar xvfz qrencode-3.4.4.tar.gz
tar xvfz libpng-1.6.21.tar.gz
cd $HOME/deps/zlib-1.2.8
./configure
make
sudo make install
cd $HOME/deps/libpng-1.6.21
./autogen.sh
./configure
make
sudo make install
sudo apt-get install -y libqrencode-dev
cd $HOME/blackbitcoin/blackbitcoin-core
qmake "RELEASE=1"
make -j$NPROC
