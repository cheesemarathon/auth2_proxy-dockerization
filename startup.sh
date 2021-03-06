#!/bin/bash

file="/etc/oauth2/oauth2_proxy.cfg"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
    wget https://raw.githubusercontent.com/cheesemarathon/OAuth2-Proxy/master/oauth2_proxy.cfg -P /etc/oauth2/
    chmod 664 /etc/oauth2/oauth2_proxy.cfg
fi

file="/etc/oauth2/emails.cfg"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
    wget https://gitlab.squishedmooo.com/cheesemarathon/OAuth2-Proxy/raw/master/startup.sh -P /etc/oauth2/
    chmod 664 /etc/oauth2/emails.cfg
fi

file="/etc/oauth2/templates/sign_in.html"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
    wget https://gitlab.squishedmooo.com/cheesemarathon/OAuth2-Proxy/raw/master/templates/sign_in.html -P /etc/oauth2/templates/
    chmod 664 /etc/oauth2/templates/sign_in.html
fi

file="/etc/oauth2/templates/error.html"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
    wget https://gitlab.squishedmooo.com/cheesemarathon/OAuth2-Proxy/raw/master/templates/error.html -P /etc/oauth2/templates/
    chmod 664 /etc/oauth2/templates/error.html
fi

echo "Setup Complete! Starting OAuth2 Proxy"

exec /bin/oauth2_proxy -config=/etc/oauth2/oauth2_proxy.cfg
