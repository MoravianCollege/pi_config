if [ $(id -u) -ne 0 ] ; then 
    echo "Ussage: sudo config.sh <hostname> <new pi password>"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: sudo config.sh <hostname> <new pi password"
    exit 1
fi

echo 'Updating  apt-get'
apt-get -q update 
apt-get -q upgrade -y 
echo 'Enabling ssh'
systemctl enable ssh
echo 'Setting hostname'
echo $1 > /etc/hostname
sed -i "s/raspberrypi/$1/" /etc/hosts

echo 'Setting pi password'
echo pi:$2 | chpasswd

