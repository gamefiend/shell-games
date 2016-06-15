# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export SKEL_ALT='skel_alt_anna'
alias special="echo ${SKEL_ALT}"
