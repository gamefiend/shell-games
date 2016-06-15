#!/bin/bash

# create the user joyce, and use a particular skeleton file
# skeleton file is a template used to create users by default.
# in 1a we create variables to make this generally useful.

# create a variable USER based on our input
USER=$1

useradd -m -k /etc/skel_alt "${USER}"

# make a quick note to ourselves which skeleton she has and when we created the account so we know for later.

echo "user ${USER} created from template 'skel_alt' on $(date)" >> /var/log/usercreate.log

