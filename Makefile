EXCLUDES := .DS_Store
DOTFILES := $(filter-out $(EXCLUDES), $(notdir $(wildcard ./home/.??*)))
XDGCONFS := $(filter-out $(EXCLUDES), $(notdir $(wildcard ./config/*)))
VSCONFS  := $(notdir $(wildcard ./vscode/*.json))
DEPLOYED := $(DOTFILES) $(addprefix .config/, $(XDGCONFS))

DEFAULT:

list:
	@echo "Files to be deployed to $(HOME):"
	@$(foreach file, $(DEPLOYED), echo " $(file)";)

init:
	@[ $(uname) = Darwin ] && DOTPATH=$(CURDIR) bash $(DOTPATH)/etc/init/initialize.sh

deploy:
	@[ -d ~/.config ] || mkdir ~/.config
	@$(foreach file, $(DOTFILES), ln -sfnv $(abspath home/$(file))   ~/$(file);)
	@$(foreach conf, $(XDGCONFS), ln -sfnv $(abspath config/$(conf)) ~/.config/$(conf);)

install: init deploy

update:
	@git pull origin master
	@git submodule update --init --recursive
	@git submodule foreach git pull origin master
	@echo 'Update other plugins:'
	@myupdate

clean:
	@echo 'Clean up dotfiles:'
	@$(foreach link, $(DEPLOYED), unlink ~/$(link);)
	@rm -rfi $(DOTPATH)

help:
	@echo 'list     List files to be deployed'
	@echo 'init     Initialize macOS environment'
	@echo 'deploy   Deploy dotfiles'
	@echo 'install  Initialize and deploy'
	@echo 'update   Update dotfiles, submodules and other plugins'
	@echo 'help     Display help message'
