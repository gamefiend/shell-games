#!/bin/bash

# create the user joyce, and use a particular skeleton file
# skeleton file is a template used to create users by default.

useradd -m -k /etc/skel_alt joyce

# make a quick note to ourselves which skeleton she has and when we created the account so we know for later.

echo "user joyce created from template 'skel_alt' on $(date)" >> /var/log/usercreate.log

