export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;36m\]\$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] "
(__git_ps1 >/dev/null 2>&1) || . /usr/share/bash-completion/git
export PYTHONPATH=$PYTHONPATH:/sw/spokes/hub/project_tools/pylintplugins
