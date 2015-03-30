unRAID docker container for glftpd: (http://glftpd.eu/)

`/usr/bin/docker run -d –name=“glFTPd” –net=“host” -v “/path/to/your/glftpd/folder”:“/glftpd”:rw slrgde/glftpd`

When using glftpd for the first time, make sure to connect via ftp from localhost.
The default user and password is glftpd. Create a new site op user and delete
the glftpd one. Otherwise you'll not be able to access glftpd from remote hosts.
