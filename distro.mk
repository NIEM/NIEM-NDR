
SHELL = /bin/bash

RELEASES_DIR = tmp/release

DISTRO_ID = NIEM-NDR-3.0r2-2015-03-14

DISTRO_NO_TOOLS_DIR_NAME = $(DISTRO_ID)
DISTRO_NO_TOOLS_DIR = $(RELEASES_DIR)/$(DISTRO_NO_TOOLS_DIR_NAME)
DISTRO_NO_TOOLS_ZIP_NAME = $(DISTRO_NO_TOOLS_DIR_NAME).zip
DISTRO_NO_TOOLS_ZIP = $(RELEASES_DIR)/$(DISTRO_NO_TOOLS_ZIP_NAME)

DISTRO_WITH_TOOLS_DIR_NAME = $(DISTRO_ID)-tools
DISTRO_WITH_TOOLS_DIR = $(RELEASES_DIR)/$(DISTRO_WITH_TOOLS_DIR_NAME)
DISTRO_WITH_TOOLS_ZIP_NAME = $(DISTRO_WITH_TOOLS_DIR_NAME).zip
DISTRO_WITH_TOOLS_ZIP = $(RELEASES_DIR)/$(DISTRO_WITH_TOOLS_ZIP_NAME)

DISTRO_HTML_NAME = $(DISTRO_ID).html
DISTRO_HTML = $(RELEASES_DIR)/$(DISTRO_HTML_NAME)

.PHONY: default
default: help

.PHONY: help
help:
	@echo "Pick a target."
	@echo "Main Targets:"
	@echo "  clean: remove all intermediates"
	@echo "Other useful targets:"
	@echo "  help: print this help"
	@echo "  packages: build all the packages in the distro"
	@echo "  release: produce a release (into $(RELEASES_DIR))"

.PHONY: packages
packages:
	for d in $(wildcard distro/stow/*); \
	do if test -f $$d/Makefile; \
	   then $(MAKE) VERSION=3.0r2 DATE=2015-03-14 -C $$d; \
	   fi; \
	done

.PHONY: packages-clean
packages-clean:
	for d in distro/stow/*; \
	do if test -f $$d/Makefile; \
	   then $(MAKE) VERSION=3.0r2 DATE=2015-03-14 -C $$d clean; \
	   fi; \
	done

.PHONY: clean
clean: uninstall packages-clean
	$(RM) -rf $(RELEASES_DIR)


# These are set as phony to fool Make when the dirs already exist
# The main job here is to populate these dirs
.PHONY: $(DISTRO_NO_TOOLS_DIR) $(DISTRO_WITH_TOOLS_DIR)
$(DISTRO_NO_TOOLS_DIR):
	mkdir -p $(DISTRO_NO_TOOLS_DIR)
	rsync -P -r -v --copy-links distro/ $(DISTRO_NO_TOOLS_DIR)/ --exclude='stow/' --exclude='bin/' --exclude='lib/' --exclude='*~' --exclude='tmp.*' --delete

$(DISTRO_WITH_TOOLS_DIR):
	mkdir -p $(DISTRO_WITH_TOOLS_DIR)
	rsync -P -r -v --copy-links distro/ $(DISTRO_WITH_TOOLS_DIR)/ --exclude='stow/' --exclude='*~' --exclude='tmp.*' --delete

uninstall:
	cd distro/stow; stow --no-fold -D *
	$(MAKE) -f distro.mk packages-clean

install: packages
	cd distro/stow; stow --no-fold -S *

release: clean packages install
	$(MAKE) -f distro.mk $(DISTRO_NO_TOOLS_DIR)
	cd $(RELEASES_DIR); zip -r -9 $(DISTRO_NO_TOOLS_ZIP_NAME) $(DISTRO_NO_TOOLS_DIR_NAME)
	$(MAKE) -f distro.mk $(DISTRO_WITH_TOOLS_DIR)
	cd $(RELEASES_DIR); zip -r -9 $(DISTRO_WITH_TOOLS_ZIP_NAME) $(DISTRO_WITH_TOOLS_DIR_NAME)
	cp distro/ndr-doc.html $(DISTRO_HTML)
