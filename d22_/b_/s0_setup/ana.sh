
#
ana_id_=( "gh22io" "gh22" )
ana_id=${ana_id_[1]}


#
#
#
reset_=( "conda deactivate"
  "conda env remove --name ${ana_id}"
)
reset() {
  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character
  # echo "#" $nm0 - $nm1 - "$@"

  case "$@" in
    ${nm0} | ${nm1} )
      echo "${reset_[0]}"
    ;;
    ${nm0}- | ${nm1}- )
      ${reset_[0]}
    ;;
  esac
}


#
# Anaconda environment
#
start_len=2
start_sc0="conda create  -y --name=${ana_id}  --clone base"
start_sc1="conda install -y --name=${ana_id}  -c conda-forge "
start_sc1_pack=" sphinx sphinxcontrib-apidoc myst-parser sphinxcontrib-bibtex sphinx-book-theme"
start_sc8="conda create  --name=${ana_id} -y python==3.9"
start_sc9="conda activate ${ana_id}"
start_=(
  "${start_sc0}"
  "${start_sc1} ${start_sc1_pack}"
  "${start_sc9}"
)

start() {
  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character

  case "$@" in
    ${nm0} | ${nm1} )
      for (( c=0; c<=$start_len; c++ ))
      do
        echo " # ${start_[$c]} "
      done
    ;;
    ${nm0}- | ${nm1}- )
      for (( c=0; c<=$start_len; c++ ))
      do
        ${start_[$c]}
      done
    ;;
  esac
}

#
# Duplicate
#
d_0="${ana_id}.yaml"
d_1="conda env export --name=${ana_id} --from-history "
export_=(
  "${d_0}"
  "${d_1}"
)
export() {
  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character

  case "$@" in
    ${nm0} | ${nm1} )
      echo " # ${export_[1]}"
      echo " # ${export_[0]}"
    ;;
    ${nm0}- | ${nm1}- )
      echo "# ${export_[1]}"
      echo "# ${export_[0]}"
      ${export_[1]} > ${export_[0]}
      echo "# Done"
    ;;
  esac
}


#
#
#
c_1="conda env create --name ${ana_id} --file=${d_0}"
create_=(
  "${c_1}"
)
import() {
  nm1=${FUNCNAME[0]}
  nm0=${nm1:0:1} # first character

  case "$@" in
     ${nm1} | ${nm0} )
      echo "# ${nm0} : ${nm1} "
      echo "# ${d_0}"
      if [ -e ${d_0} ];
        then
          echo "# File exists: ${d_0} "
        else
          echo "# File missing: ${d_0} "
      fi
      echo "${import_[0]}"
    ;;
    ${nm1}- | ${nm0}- )
      ${import_[0]}
    ;;
  esac
}

#
#
#
act() {
  reset "$@"
  start "$@"
  export "$@"
  import "$@"
}
act "$@"



#
#
# conda install --name=og22dash3 -y -c conda-forge
# dash pandas numpy matplotlib Werkzeug
# dash-bootstrap-components
# conda install -y -c conda-forge dash==2.1
#

#
# sphinx
# livereload
# conda install -c conda-forge livereload
# conda install -c conda-forge myst-parser
# conda install -c conda-forge sphinx-autobuild
# conda install -c conda-forge
# conda install -c conda-forge sphinx.ext.autosectionlabel




