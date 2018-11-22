if [ "$#" -ne 1 ]; then
    echo "Usage: config.sh <hostname>"
    exit 1
fi

echo 'Updating  apt-get'
apt-get update
apt-get upgrade -y
echo 'Enabling ssh'
systemctl enable ssh
echo 'Setting hostname'
echo $1 > /etc/hostname
sed -i "s/raspberrypi/$1/" /etc/hosts
