#!/bin/bash

#
# sphinx-book-theme
#

#ana_bin=/usr/local/anaconda3/envs/gh22io/bin
#s_build=${ana_bin}/sphinx-build
#s_apidoc=${ana_bin}/sphinx-apidoc
#s_quickstart=${ana_bin}/sphinx-quickstart
#
# which sphinx-quickstart
#
s_build=$(which sphinx-build)
s_apidoc=$(which sphix-apidoc)
s_quickstart=$(which sphinx-quickstart)


#
# [] Constants
#
TARGET="../../b"
CUSTOM="../../b_"
VERSION=11
KODE="./k" # Code location
HELP="help"

#
# Source
#
S_Cfg=${CUSTOM}/s1_core/b_conf
S_Idx=${CUSTOM}/s1_core/c_index
S_Chg=${CUSTOM}/s1_core/a_changelog
S_Sttc=${CUSTOM}/s1_core/d_logo
#S_Tmpl=${CUSTOM}/s4_template_
#S_Img=${CUSTOM}/s4_image_
S_Page=${CUSTOM}/s2_page
S_Blog=${CUSTOM}/s3_blog

#
# HOME
#
H_Src=${TARGET}/source
H_Sttc=${H_Src}/_static
H_Tmpl=${H_Src}/_templates
H_Page=${H_Src}/_page



#
#
#
reset_=( "rm -rf ${TARGET}" )
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
# START
#
start_arg="--sep --project og --author dsm --release 0.0 --language en --no-batchfile"


#  --ext-autodoc         enable autodoc extension
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

start_end=8
start_=(
  # 0:Start
  "${s_quickstart} ${start_arg} ${start_ext} ${TARGET}"
  # 1:Conf
  #  "patch ${H_Src}/conf.py ${S_Cfg}/conf${VERSION}.py.diff"
  " cp ${S_Cfg}/conf${VERSION}.py ${H_Src}/conf.py"
  # 2:INDEX-rst
  "rm ${H_Src}/index.rst"
  # 3:INDEX-md
  "cp ${S_Idx}/index${VERSION}.md ${H_Src}/index.md"
  # 4: Index Patching
  #  "patch ${H_Src}/index.md ${S_Idx}/index${VERSION}.md.diff"
  # 4. Static - custom css
  "cp ${S_Sttc}/* ${H_Sttc}"
  # X Template
  #"cp ${S_Tmpl}/* ${H_Tmpl}"
  # X Logo Images
  #"cp ${S_Img}/* ${H_Sttc}"
  # 5. Pages
  "mkdir ${H_Page}"
  # 6. Content
  "cp -rf ${S_Page}/* ${H_Page}"
  # 7. ChangeLog
  "cp ${S_Chg}/changelog.md ${H_Src}"
  # 8. .nojekyll
  "touch ${H_Src}/.nojekyll"
  # 0:Help
  "${s_quickstart} --help"
#  "cp -rf ${TARGET}_/_templates_/* ${TARGET}/source/_templates"
#  "cp -rf ${TARGET}_/_static_/* ${TARGET}/source/_static"
#  "cp -rf ${TARGET}_/_pages_/* ${TARGET}/source/"
)
start() {

  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character
  # echo "#" $nm0 - $nm1 - "$@"

  case "$@" in
    ${nm0} | ${nm1} )
      echo " # start_end:" $start_end
      echo " # reset_"${reset_[0]}
      for (( c=0; c<= $start_end; c++ ))
      do
        echo " # ${start_[$c]} "
      done
    ;;
    ${nm0}- | ${nm1}- )
      ${reset_[0]}
      for (( c=0; c<= $start_end; c++ ))
      do
        echo "${start_[$c]}"
        ${start_[$c]}
      done
    ;;
    ${nm0}-help | ${nm1}-help | ${nm1}-h )
      echo ${start_[$start_end+1]}
    ;;
  esac
}

#
#
#
api_act=( "${s_apidoc} --help"
 "${s_apidoc} -f -o ${TARGET}/source ${KODE}"
)
api() {

  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character
  # echo "#" $nm0 - $nm1 - "$@"

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
build_src=${TARGET}"/source "
build_out=${TARGET}"/build "
build_file=" -a "
build_arg="  "
build_act=( "${s_build} --help",
  "${s_build} ${build_arg} ${build_src} ${build_out} ${build_file}"
  "open ${TARGET}/build/index.html"
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


conda_act=(
    # External stuff
    "conda install -c conda-forge myst-parser"
    # Internal
    # "conda install -c conda-forge sphinx.ext.autodoc",
    # "conda install -c conda-forge sphinx.ext.extlinks",
    # "conda install -c conda-forge sphinx.ext.intersphinx",
    # "conda install -c conda-forge sphinx.ext.mathjax",
    # "conda install -c conda-forge sphinx.ext.todo",
    # "conda install -c conda-forge sphinx.ext.viewcode",
    )



#
#
#
act(){

  reset "$@"
  start "$@"
  api   "$@"
  build "$@"

}
act "$@"
