HUB_URL="https://github.com/dwisianto/"
HUB_NAME="dwisianto.github.io"

BRANCH_NAME_=("d22/one" "d22/two")
BRANCH_NAME=${BRANCH_NAME_[0]}
TAG_NAME_=( "one" "two" )
TAG_NAME=${TAG_NAME_[0]}


#
#
#
reset_len=2
reset_=( "rm -rf ${HUB_NAME}"
  "git checkout -b ${BRANCH_NAME}"
)
reset() {

  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character
  # echo "#" $nm0 - $nm1 - "$@"

  case "$@" in
    ${nm0} | ${nm1} )
      echo "# ${reset_[0]}"
    ;;
    ${nm0}- | ${nm1}- )
      ${reset_[0]}
    ;;
  esac
}


#
#
#
info_=( "git config --list" )
info() {

  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character
  # echo "#" $nm0 - $nm1 - "$@"

  case "$@" in
    ${nm0} | ${nm1} )
      echo "# ${info_[0]}"
    ;;
    ${nm0}- | ${nm1}- )
      ${info_[0]}
    ;;
  esac
}



#
#
#
act(){

  reset "$@"
  info "$@"

}
act "$@"

#
# Branch Rename
#
