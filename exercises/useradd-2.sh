#!/bin/bash

# create the user joyce, and use a particular skeleton file
# skeleton file is a template used to create users by default.
# in exercise 2 we check for certain conditionals and direct the program in conjunction with that.

# create a variable USER based on our input
USER=$1

# Let's check for a certain user. anna has a special template she needs to use, '/etc/skel_alt_anna'
if [ "${USER}" == "anna" ]; then
    echo "${USER}, hello! I have set up things special just for you."
    useradd -m -k /etc/skel_anna "${USER}"
    echo "user ${USER} created from template 'skel_alt_anna' on $(date)" >> /var/log/usercreate.log
else # we use else to get both the true and false tests covered.
    echo "${USER}, hi! I've got things set up just how I think you will want them."
    useradd -m -k /etc/skel_alt "${USER}"
    echo "user ${USER} created from template 'skel_alt' on $(date)" >> /var/log/usercreate.log
fi
