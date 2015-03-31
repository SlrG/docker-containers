unRAID docker container for glftpd: (http://glftpd.eu/)

```
/usr/bin/docker run -d –name=“glFTPd” –net=“host” -v “/path/to/your/glftpd/folder”:“/glftpd”:rw slrgde/glftpd
```

When using glFTPd for the first time, make sure to connect via ftp from localhost.
The default user and password is glftpd. Create a new site op user and delete
the glftpd one. Otherwise you'll not be able to access glFTPd from remote hosts.

To login you can use the ftp client inside the running docker container.

```
docker exec -ti glFTPd /bin/bash
ftp localhost 1337
```

or install an [ftp client package](http://mirrors.slackware.com/slackware/slackware64-14.1/slackware64/n/netkit-ftp-0.17-x86_64-1.txz)
on your unRAID and use that to connect to glFTPd without entering the container.

When logged in:

```
site adduser username password
site addip username *@*
site change username flags +147ABCDEFGHI
site deluser glftpd
```

After reconnecting as username:

```
site purge *
```

The ftp data must be added to the "site" dir in the glftpd folder.
If you don't want to copy data to that dir, that you already have on
your array, you will need the [powerdown plugin](https://lime-technology.com/forum/index.php?topic=31735.0).
and utilize its S(tart) and K(ill) scripts to execute mount and umount
commands:

```
mkdir /mnt/cache/glftpd/site/movies;mount --bind /mnt/user0/movies /mnt/cache/glftpd/site/movies
```

```
umount /mnt/cache/glftpd/site/movies;rmdir /mnt/cache/glftpd/site/movies
```
