.PHONY: all
all: bin dotfiles

.PHONY: bin
mac_os_bin: ## Installs the macOS bin directory files.
	for file in $(shell find $(CURDIR)/bin -type f); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

.PHONY: debian_bin
debian_bin: ## Installs the Debian bin directory files.
	for file in $(shell find $(CURDIR)/bin -type f -name "debian_*"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles.
	for file in $(shell find $(CURDIR) -type f -name ".*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
