if command -v yum &> /dev/null
then
    yum install wget tar yasm -y
elif command -v apt-get &> /dev/null
then
    apt update
    apt-get install wget tar yasm -y
else
    echo "Unknown package manager, please install wget, tar, yasm manually."
    exit 1
fi

/usr/bin/tar -zxvf ffmpeg-4.4.1.tar.gz
cd ffmpeg-4.4.1
./configure --prefix=/usr/local/ffmpeg
make && make install
echo "export PATH=\$PATH:/usr/local/ffmpeg/bin" >> /etc/profile
source /etc/profile

rm -rf ffmpeg-4.4.1
echo "FFmpeg installed successfully."
