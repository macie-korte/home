1.  Make your machine able to check out code
  1.	ssh-keygen -t dsa
  2.	accept all defaults
  3.	cat /root/.ssh/id_dsa.pub
  4.	take results and paste into GitHub @: https://github.com/settings/ssh
  5.	edit an existing or make a new public key record
2.	Configure your home directory
  1.	cd /root
  2.	git clone git@github.com:macie-korte/home .home
  3.	rm .bashrc
  4.	ln -s .home/.* .
  5.	rm .git
  6.	exec bash –login  (now git bash prompt should be working)
  7.	emerge a few tools for later use:
    a.	“emerge squashfs-tools”
    b.	echo "sys-fs/squashfs-tools lzo" >> /etc/portage/package.use/squash
    c.	ssh root@bigdell gpg2 --export-secret-keys | gpg2 --import
    d.	“emerge lsof”
3.	Configure Samba
  1.	ln –s /root/.home/conf/package.use /etc/portage/package.use/samba
  2.	emerge samba
  3.	ln -sf /root/.home/conf/smb.conf /etc/samba/smb.conf
  4.	smbpasswd -a root
  5.	ln –sf /root/.home/bin/mount-sw  /bin/
  6.	/bin/mount-sw
4.	Check out code
  1.	Stop all running services seen under screen –list
  2.	“umount /sw”
  3.	 “cd /”
  4.	“rm –rf /sw”
  5.	“git clone git@github.com:macie-korte/sparkweave /sw”
  6.	“make -C /sw”
  7.	systemctl start sw-startup.service
  8.	systemctl start admin-console.service
5.	View code from Windows
  1.	run \\192.168.1.117 and see if you can access the VM
  2.	Go to “Map a network drive” and do it
  3.	If this doesn’t work, REBOOT Windows.
6.	Change Password
  1.	“passwd root”