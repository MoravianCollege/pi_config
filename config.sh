if [ "$#" -ne 1 ]; then
    echo "Usage: config.sh <hostname>"
    exit 1
fi

apt-get update
apt-get upgrade -y
systemctl enable ssh
echo $1 > /etc/hostname
sed -i "s/raspberry/$1/" /etc/hosts
