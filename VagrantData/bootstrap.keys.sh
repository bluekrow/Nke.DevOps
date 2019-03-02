
mkdir -m 0700 /root/.ssh
cp /vagrant/id_ed25519.pub /root/.ssh/authorized_keys
cat /vagrant/id_ed25519.pub >> /home/vagrant/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys