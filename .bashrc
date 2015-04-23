## Note: this doesn't work if you symlink to the dotfiles repo
alias realias='source ~/.bashrc'

## virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

## mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

## Git convenience
alias gs="git status"

## Music/mixing
alias xf='cd ~/Dropbox/CROSSFIRE; ls'
alias xfv='cd ~/Dropbox/CROSSFIRE/Video; ls'
alias music='cd ~/Dropbox/Music\ \(1\); ls'

## Coding convenience
alias la='ls -al'
alias realias='source ~/.bashrc'
alias gd='cd ~/Code/golddigger; ls'
alias em='cd ~/Code/emissary; ls'
alias ema='cd ~/Code/emissary/emissary-api; ls'
alias emi='cd ~/Code/emissary/emissary-ios; ls'
alias dots='cd ~/Code/personal/dotfiles; ls -al'

## Shell changes
function cd () {
  local -ri n=${#*};
  if [ $n -eq 0 -o -d "${!n}" -o "${!n}" == "-" ]; then
    builtin cd "$@";
  else
    local e="s:\.\.\.:../..:g";
    builtin cd "${@:1:$n-1}" $(sed -e$e -e$e -e$e <<< "${!n}");
  fi
}

## Lolz
alias fucking=sudo

## Wow. Much add file.js. Such commit. Very push.
#                  Y.                      _
#                  YiL                   .```.
#                  Yii;      WOW       .; .;;`.
#                  YY;ii._           .;`.;;;; :
#                  iiYYYYYYiiiii;;;;i` ;;::;;;;
#              _.;YYYYYYiiiiiiYYYii  .;;.   ;;;
#           .YYYYYYYYYYiiYYYYYYYYYYYYii;`  ;;;;
#         .YYYYYYY$$YYiiYY$$$$iiiYYYYYY;.ii;`..
#        :YYY$!.  TYiiYY$$$$$YYYYYYYiiYYYYiYYii.
#        Y$MM$:   :YYYYYY$!"``"4YYYYYiiiYYYYiiYY.
#     `. :MM$$b.,dYY$$Yii" :'   :YYYYllYiiYYYiYY
#  _.._ :`4MM$!YYYYYYYYYii,.__.diii$$YYYYYYYYYYY
#  .,._ $b`P`     "4$$$$$iiiiiiii$$$$YY$$$$$$YiY;
#     `,.`$:       :$$$$$$$$$YYYYY$$$$$$$$$YYiiYYL
#      "`;$$.    .;PPb$`.,.``T$$YY$$$$YYYYYYiiiYYU:
#    ' ;$P$;;: ;;;;i$y$"!Y$$$b;$$$Y$YY$$YYYiiiYYiYY
#      $Fi$$ .. ``:iii.`-";YYYYY$$YY$$$$$YYYiiYiYYY
#      :Y$$rb ````  `_..;;i;YYY$YY$$$$$$$YYYYYYYiYY:
#       :$$$$$i;;iiiiidYYYYYYYYYY$$$$$$YYYYYYYiiYYYY.
#        `$$$$$$$YYYYYYYYYYYYY$$$$$$YYYYYYYYiiiYYYYYY
#        .i!$$$$$$YYYYYYYYY$$$$$$YYY$$YYiiiiiiYYYYYYY
#       :YYiii$$$$$$$YYYYYYY$$$$YY$$$$YYiiiiiYYYYYYi'
alias wow="git status"
alias very=git
alias such=git
alias much=git

