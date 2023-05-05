#!/usr/bin/env bash
export ENV_ROOT_DIR="env-manager"
source ${HOME}/${ENV_ROOT_DIR}/Manifest
source ${ENV_ROOT}/include/common.sh

# Custom
[[ -e ${ENV_LOAD}/zsh/settings/custom ]] && source ${ENV_LOAD}/zsh/settings/custom


is_cmd_exist zsh omz && load_env --zsh $(hostname -s) || install_env --zsh
is_cmd_exist rvm irb ruby gem && load_env --ruby || install_env --ruby
is_cmd_exist nvm node npm nrm pnpm && load_env --node || install_env --node 
is_cmd_exist gvm go && load_env --golang || install_env --golang
is_cmd_exist python3 pip3 pyenv && load_env --python || install_env --python 
is_cmd_exist docker docker-compose && load_env --docker || install_env --docker
