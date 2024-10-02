# Search for password in files and registry
findstr /si password *.txt
findstr /si password *.xml
findstr /si password *.ini
findstr /si password *.html
findstr /si password *.conf
findstr /si password *.config
findstr /si password *.php
findstr /si password *.pl
findstr /si password *.js
findstr /si password *.as
findstr /si password *.aspx
findstr /si password *.ascx
findstr /si password *.master
findstr /si password *.mdb
findstr /si password *.sql
findstr /si password *.cs
findstr /si password *.vb
findstr /si password .htpasswd
findstr /si password .bash_history
findstr /si password .mysql_history
findstr /si password .pgsql_history
findstr /si password .ssh_history
findstr /si password .htaccess
findstr /si password .bashrc
findstr /si password .profile
findstr /si password .bash_profile
findstr /si password .bash_logout

# Search for password in registry
reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s
reg query HKLM /f password /t REG_DWORD /s