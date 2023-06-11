#
# Makefile
#
# Requires:
#	- multipass
#
# References:
#	- NodeSource installer > Installation instructions (Ubuntu)
#		-> https://github.com/nodesource/distributions#installation-instructions
#

_MP_INSTANCE:=d41d8c
	# nothing magic about that name - just use anything that's unique (and starts with a letter)

_MP_WORK:=work
	# subfolder that is mapped to VM (actual name doesn't matter)

_MP_PARAMS=--memory 2G --disk 3G --cpus 2
	# Hint: use 'multipass info <instance>' to tune these

all:
	@false

first: _mp-image
	install -d $(MP_WORK)
	echo update-notifier=false > $(_MP_WORK)/.npmrc

#install: _mp-image
#	multipass exec $(_MP_INSTANCE) -d $(_MP_WORK) -- sh -c 'pwd && npm install'

# Note: You can do any number of such targets - or 'make shell' and run development from there.
#
build: _mp-image
	multipass exec $(_MP_INSTANCE) -d $(_MP_WORK) -- sh -c 'pwd && npm run build'

# Checks that a) 'multipass' exists as a command, b) downloads the Ubuntu image we use.
#
# Note: Downloading would happen also automatically, but wanted to make it explicit.
#
_mp-image: _mp-exists
	(multipass list | grep $(_MP_INSTANCE) > /dev/null) || ( \
      multipass launch lts --name $(_MP_INSTANCE) --mount $(shell pwd)/$(_MP_WORK):/home/ubuntu/$(_MP_WORK) $(_MP_PARAMS) && \
      multipass exec $(_MP_INSTANCE) -- sudo apt-get update && \
      multipass exec $(_MP_INSTANCE) -- bash -c 'curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs' && \
      multipass exec $(_MP_INSTANCE) -- bash -c 'node --version && npm --version' \
	)

# Fail if Multipass is not installed.
# tbd. give an error message if not installed
_mp-exists:
	@multipass --version >/dev/null

# Manual: shell
shell: _mp-image
	multipass shell $(_MP_INSTANCE)

# TEMP: testing
TEMP_tst_v: _mp-image
	multipass exec $(_MP_INSTANCE) -- npm --version
	  # WORKS

#---
echo:
	@echo A

.PHONY: all _mp-image _mp-exists shell echo
