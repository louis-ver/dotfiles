# Dotfiles for macOS and debian

This repository contains my dotfiles for macOS and debian.

## Install

```
$ make
```

You can specify which parts of the Makefile you want by simply appending `mac_os_bin`, `debian_bin` or `dotfiles` to the `make` command.

### Installing all binaries

Running make simply creates symlinks to the dotfiles. To run install scripts:

```
$ /usr/local/bin/mac_os_install.sh
$ /usr/local/bin/mac_os_defaults.sh
```
