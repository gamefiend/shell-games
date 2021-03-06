#!/bin/bash

# create the user joyce, and use a particular skeleton file
# skeleton file is a template used to create users by default.
# in exercise 3, we add the ability to take parameters to standardize our inputs.

while [ $# -gt 0 ] # '$#' is the number of arguments in the command line
do
    case $1 in
    --user | -u)
    shift           # You need this shift to move to the actual value.
    USER=$1
    ;;
    --skel |  -s)
    shift
    SKEL_ALT_DEFAULT=$1
    ;;
    -*)             # anything else sends a help screen
    echo "please call this script specifying the --user argument (required) and the --skel argument (optional)"
    echo "example:"
    echo "$0 --user example --skel '/etc/skel_example'"
    exit 1
    ;;
    esac
    shift           # bump after each pass through
done

# specify that SKEL_ALT_DEFAULT is '/etc/skel_alt' unless someone specifies something else in the second argument.
if [ -z "${SKEL_ALT_DEFAULT}" ]; then
    SKEL_ALT_DEFAULT='/etc/skel_alt'
fi
# if USER is blank, quit.
if [ -z "${USER}" ]; then
    echo "--user must be specified..."
    echo "please call this script specifying the --user argument (required) and the --skel argument (optional)"
    echo "example:"
    echo "$0 --user example --skel '/etc/skel_example'"
    exit 1
fi

# does this user exist already? Tell us and leave if it does...

# first use an id search to check
id "${USER}"

# now do a test... True is 0, False anything > 0. '$?' is a special variable that holds the return value of the last command
if [ $? -gt 0 ]; then #if it's false then tell us the user exists and quit.
    echo "User already exists."
    exit 1 # we return our own code that indicates failure. We can use any number to indicate different types of failure for use in other scripts.
fi # closes an if statement.

# otherwise let's proceed as normal.

# Let's check for a certain user. anna has a special template she needs to use, '/etc/skel_alt_anna'
if [ "${USER}" == "anna" ]; then
    echo "${USER}, hello! I have set up things special just for you."
    useradd -m -k /etc/skel_anna "${USER}"
    echo "user ${USER} created from template 'skel_alt_anna' on $(date)" >> /var/log/usercreate.log
else # we use else to get both the true and false tests covered.
    echo "${USER}, hi! I've got things set up just how I think you will want them."
    useradd -m -k "${SKEL_ALT_DEFAULT}" "${USER}"
    echo "user ${USER} created from template '${SKEL_ALT_DEFAULT}' on $(date)" >> /var/log/usercreate.log
fi



