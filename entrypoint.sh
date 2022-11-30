set -euxo pipefail
cat << HEREDOC >> /etc/ssh/sshd_config
Port 80
PermitRootLogin without-password
PubkeyAuthentication yes
HEREDOC
key=~/.ssh/id_rsa
ssh-keygen -f $key -N ''
ln -s $key.pub ~/.ssh/authorized_keys
echo "==== The private key ===="
cat $key
service ssh start
echo "ready for connection, use:"
echo "  ssh -i <key from above> root@<ip> -p 80"
sleep 99d
