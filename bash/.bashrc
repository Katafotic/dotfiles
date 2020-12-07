# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


PATH="$PATH:/opt"
export PATH


# IMSL

IMSL_LIC_FILE="/opt/RogueWav/license/imsl_eval.dat"
export IMSL_LIC_FILE

ROGUEWAVE_DIR="/opt/RogueWave"
CNL_DIR="/opt/RogueWave/imsl/cnl-2019.0.0"
IMSL_DIR="/opt/RogueWave/imsl"
LIB_ARCH=lnxgc731x64
BIN_DIR=$CNL_DIR/$LIB_ARCH/bin

export ROGUEWAVE_DIR IMSL_DIR BIN_DIR LIB_ARCH CNL_DIR 

CNL_LICENSE_NUMBER=999999
export CNL_LICENSE_NUMBER

if [ "$OMP_NESTED" = "" ] ; then
   OMP_NESTED=FALSE
   export OMP_NESTED
fi

CC=gcc
CFLAGS="-fopenmp -ansi -I$CNL_DIR/$LIB_ARCH/include"
CNL_EXAMPLES="$CNL_DIR/$LIB_ARCH/examples"
CNL_COMPILER_VERSION="gcc version 7.3.1 (SUSE Linux)"
CNL_OS_VERSION="SUSE Linux Enterprise Server release 15"
CNL_VERSION=2019.0.0
export CC CFLAGS CNL_EXAMPLES CNL_COMPILER_VERSION CNL_OS_VERSION CNL_VERSION

MKL_DIR=$CNL_DIR/$LIB_ARCH/mkl/11.3.3
export MKL_DIR

IMSLERRPATH="$CNL_DIR/$LIB_ARCH/bin/"
IMSLSERRPATH="$CNL_DIR/$LIB_ARCH/bin/"
export IMSLERRPATH IMSLSERRPATH

if [ "$LD_LIBRARY_PATH" = "" ] ; then
   LD_LIBRARY_PATH="$MKL_DIR/lib/intel64"
else
   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MKL_DIR/lib/intel64"
fi
export LD_LIBRARY_PATH

LINK_CNL_SHARED="-L$CNL_DIR/$LIB_ARCH/lib -L$MKL_DIR/lib/intel64 -limslcmath -limslcstat -lmkl_intel_lp64 -lmkl_core -lmkl_intel_thread -liomp5 -ldl -lpthread -lm -Xlinker -rpath -Xlinker $CNL_DIR/$LIB_ARCH/lib -Xlinker -rpath -Xlinker $MKL_DIR/lib/intel64"
LINK_CNL_STATIC="-L$CNL_DIR/$LIB_ARCH/lib -L$MKL_DIR/lib/intel64 -Wl,-Bstatic -Wl,--start-group -limslcmath -limslcstat -Wl,--end-group -Wl,-Bdynamic -lmkl_intel_lp64 -lmkl_core -lmkl_intel_thread -liomp5 -ldl -lpthread -lm -Xlinker -rpath -Xlinker $MKL_DIR/lib/intel64"
LINK_CNL="$LINK_CNL_SHARED"
export LINK_CNL_SHARED LINK_CNL_STATIC LINK_CNL

LINK_CNL_SHARED_IMSL="-L$CNL_DIR/$LIB_ARCH/lib -limslcmath_imsl -limslcstat_imsl -lpthread -lm -ldl -Xlinker -rpath -Xlinker $CNL_DIR/$LIB_ARCH/lib"
LINK_CNL_STATIC_IMSL="-L$CNL_DIR/$LIB_ARCH/lib -Wl,-Bstatic -Wl,--start-group -limslcmath_imsl -limslcstat_imsl -Wl,--end-group -Wl,-Bdynamic -lpthread -lm -ldl"
LINK_CNL_IMSL="$LINK_CNL_SHARED_IMSL"
export LINK_CNL_SHARED_IMSL LINK_CNL_STATIC_IMSL LINK_CNL_IMSL

if [ ! -f $CNL_DIR/$LIB_ARCH/lib/libimslcmath.so ] ; then
   LINK_CNL_SHARED="$LINK_CNL_SHARED_IMSL"
   LINK_CNL="$LINK_CNL_SHARED_IMSL"
else
   LINK_CNL_SMP="$LINK_CNL"
   LINK_CNL_SHARED_SMP="$LINK_CNL_SHARED"
   export LINK_CNL_SMP LINK_CNL_SHARED_SMP
fi

if [ ! -f $CNL_DIR/$LIB_ARCH/lib/libimslcmath.a ] ; then
   LINK_CNL_STATIC="$LINK_CNL_STATIC_IMSL"
else
   LINK_CNL_STATIC_SMP="$LINK_CNL_STATIC"
   export LINK_CNL_STATIC_SMP
fi



# Anaconda was installed in /opt/anaconda3
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


conda config --set auto_activate_base false
