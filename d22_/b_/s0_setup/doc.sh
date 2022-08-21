#!/bin/bash

#
# conda install -c conda-forge sphinx
# conda install -c conda-forge sphinxcontrib-apidoc  sphinxcontrib-bibtex myst-parser
# conda install -c conda-forge




# which sphinx-quickstart
ana_bin=/usr/local/anaconda3/envs/og22b/bin
s_build=${ana_bin}/sphinx-build
s_apidoc=${ana_bin}/sphinx-apidoc
s_quickstart=${ana_bin}/sphinx-quickstart

#
#
#
dest="./d1/c"
kode="../src/ds1/d"
help="help"


usage() {

  nm1="usage"
  nm2="u"
  #echo "$@" - $nm1
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "# ${nm1} - ${nm2} "
    ;;
  esac

}


reset_act=( "rm -rf ${dest}" )
#
#
#
reset() {
  nm1="reset"
  nm2="r"
  #echo "$@" - $nm1
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "# ${nm1} - ${nm2} "
      echo "# ${reset_act[0]}"
    ;;
    ${nm1}- | ${nm2}- )
      ${reset_act[0]}
    ;;
  esac

}


#
#
#
start_arg="--sep --project og --author dsm --release 0.0 --language en --no-batchfile"


# --ext-autodoc         enable autodoc extension
#  --ext-doctest         enable doctest extension
#  --ext-intersphinx     enable intersphinx extension
#  --ext-todo            enable todo extension
#  --ext-coverage        enable coverage extension
#  --ext-imgmath         enable imgmath extension
#  --ext-mathjax         enable mathjax extension
#  --ext-ifconfig        enable ifconfig extension
#  --ext-viewcode        enable viewcode extension
#  --ext-githubpages     enable githubpages extension
#  --extensions EXTENSIONS
#start_ext="--ext-autodoc  --ext-viewcode"
start_ext=""


start_act=(
  "${s_quickstart} --help"
  "${s_quickstart} ${start_arg} ${start_ext} ${dest}"
  "cp -rf ${dest}_/_templates/* ${dest}/source/_templates"
  "cp -rf ${dest}_/_static/* ${dest}/source/_static"
  "cp -rf ${dest}_/_pages/* ${dest}/source/"
  "patch ${dest}/source/conf.py ${dest}_/conf.py.0.1.diff"
  "patch ${dest}/source/index.rst ${dest}_/index.rst.0.1.diff"
  "wc ${dest}_/conf.py"
)


#
#
#
start() {

  nm1="start"
  nm2="s"
  #echo "$@" - $nm1
  case "$@" in
    ${nm1} | ${nm2} )
      echo " # ${reset_act[0]} "
      for i in {1..6}
      do
        echo " # ${start_act[$i]} "
      done
    ;;
    ${nm1}-help | ${nm2}-help | ${nm2}-h )
      ${start_act[0]}
    ;;
    ${nm1}- | ${nm2}- )
      ${reset_act[0]}
      for i in {1..6}
      do
        echo "${start_act[$i]}"
        ${start_act[$i]}
      done
    ;;
    ${nm1}-diff1 | ${nm2}-diff1 )
      echo " # diff ${dest}_/conf.py.0 ${dest}/source/conf.py > ${dest}_/conf.py.0.1.diff "
    ;;
    ${nm1}-diff1- | ${nm2}-diff1- )
      diff ${dest}_/conf0.py.0 ${dest}/source/conf0.py > ${dest}_/conf0.py.0.1.diff
    ;;
    ${nm1}-diff2 | ${nm2}-diff2 )
      echo " # diff ${dest}_/index.rst.0 ${dest}/source/index.rst > ${dest}_/index.rst.0.1.diff "
    ;;
    ${nm1}-diff2- | ${nm2}-diff2- )
      diff ${dest}_/index0.rst.0 ${dest}/source/index0.rst > ${dest}_/index0.rst.0.1.diff
    ;;
  esac

}


api_act=( "${s_apidoc} --help"
 "${s_apidoc} -f -o ${dest}/source ${kode}"
)

#
#
#
api() {
  nm1="api"
  nm2="a"
  #echo "$@" - ${nm1}
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "# ${s_apidoc} "
      echo "# ${api_act[1]} "
    ;;
    ${nm1}- | ${nm2}- )
      ${api_act[1]}
    ;;
  esac

}




#
# positional arguments:
#  sourcedir         path to documentation source files
#  outputdir         path to output directory
#  filenames         a list of specific files to rebuild. Ignored if -a is specified
#
build_src=${dest}"/source "
build_out=${dest}"/build "
build_file=" -a "
build_arg="  "
build_act=( "${s_build} --help",
  "${s_build} ${build_arg} ${build_src} ${build_out} ${build_file}"
)
build() {
  nm1="build"
  nm2="b"
  #echo "$@" - $nm1
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "${build_act[1]}"
    ;;
  ${nm1}- | ${nm2}- )
      ${build_act[1]}
    ;;
  esac

}

view_act=(
  "open ${dest}/build/index.html"
)

view() {
  nm1="view"
  nm2="v"
  #echo "$@" - $nm1
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "# ${nm1} - ${nm2} "
      echo "${view_act[0]}"
    ;;
    ${nm1}- | ${nm2}- )
      ${view_act[0]}
    ;;
  esac
}


#
#
#
publish() {

  nm1="publish"
  nm2="p"
  #echo "$@" - $nm1
  case "$@" in
    ${help} | ${nm1} | ${nm2} )
      echo "# ${nm1} - ${nm2} "
      echo " # ${reset_act[0]} "
      for i in {1..6}
      do
        echo " # ${start_act[$i]} "
      done

      #
      echo "# ${api_act[1]} "
      echo "# ${build_act[1]}"
      echo "# ${view_act[1]}"
    ;;
    ${nm1}-| ${nm2}- )
      ${reset_act[0]}
      for i in {1..6}
      do
        ${start_act[$i]}
      done

      #
      ${api_act[1]}
      ${build_act[1]}
      ${view_act[1]}
    ;;

  esac


}


#
#
#
act(){

  reset "$@"
  start "$@"
  api   "$@"
  build "$@"
  view  "$@"
  publish "$@"

}
act "$@"