1.  Make your machine able to check out code
  a.	ssh-keygen -t dsa
  b.	accept all defaults
  c.	cat /root/.ssh/id_dsa.pub
  d.	take results and paste into GitHub @: https://github.com/settings/ssh
  e.	edit an existing or make a new public key record
2.	Configure your home directory
  a.	cd /root
  b.	git clone git@github.com:macie-korte/home .home
  c.	rm .bashrc
  d.	ln -s .home/.* .
  e.	rm .git
  f.	exec bash –login  (now git bash prompt should be working)
  g.	emerge a few tools for later use:
    i.	“emerge squashfs-tools”
    ii.	echo "sys-fs/squashfs-tools lzo" >> /etc/portage/package.use/squash
    iii.	ssh root@bigdell gpg2 --export-secret-keys | gpg2 --import
    iv.	“emerge lsof”
3.	Configure Samba
  a.	ln –s /root/.home/conf/package.use /etc/portage/package.use/samba
  b.	emerge samba
  c.	ln -sf /root/.home/conf/smb.conf /etc/samba/smb.conf
  d.	smbpasswd -a root
  e.	ln –sf /root/.home/bin/mount-sw  /bin/
  f.	/bin/mount-sw
4.	Check out code
  a.	Stop all running services seen under screen –list
  b.	“umount /sw”
  c.	 “cd /”
  d.	“rm –rf /sw”
  e.	“git clone git@github.com:macie-korte/sparkweave /sw”
  f.	“make -C /sw”
  g.	systemctl start sw-startup.service
  h.	systemctl start admin-console.service
5.	View code from Windows
  a.	run \\192.168.1.117 and see if you can access the VM
  b.	Go to “Map a network drive” and do it
  c.	If this doesn’t work, REBOOT Windows.
6.	Change Password
  a.	“passwd root”
7.	Admin console setup
  a.	go to http://192.168.1.117:88 in a browser
  b.	set admin password to anything
  c.	Set node name to anything – doesn’t matter what
  d.	config servers = same thing as node name
  e.	IPSec Shared key = anything made up
  f.	Configure – Ignore warnings if asked
  g.	Have Jay make a working DNS entry
    i.	Run an ifconfig
    ii.	IM Jay the HWaddr of “eth0”
    iii.	Jay adds DNS entry
    iv.	Shut down VM
    v.	Go to VM configuration in VMware player
    vi.	Network card -> advanced -> set the mac address to whatever Jay tells you to set it to.
    vii.	Start VM again
  h.	type in admin password -> next
  i.	check all 5 basic services and “set services”
  j.	Make sure rabbit is running
    i.	screen –r rabbit
    ii.	wait for it to say “broker running”
  k.	Set “admin password” for web login to “123abc”.  Click “Set Default Tenant”.
  l.	click “configure storage subsystem”
  m.	click “new storage cluster”
  n.	Fill out new storage page
    i.	cluster type = duplicating
    ii.	duplication count = 1
    iii.	parity count = empty
    iv.	cluster members = select what’s there.
    v.	“Create cluster”
  o.	Under “stream server participation”, click whatever’s available, then “Set Participation”.
  p.	Under “Tenant Cluster Assignment” click the “default” link.
  q.	check what’s available and “Set Assignments”.
  r.	Back to storage -> Back to top
  s.	click “Configure HTTP Servers” & fill it out as it makes sense.
  t.	Do a “screen –list” & make sure 28 screens are running.  Now you can log in through the web interface on port 80.
