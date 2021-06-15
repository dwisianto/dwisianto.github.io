
#
# BLG_DIR is defined in the main
# --demo site

n1a_main(){

    local nm=n1a

    case "$1" in
        ${nm}-d | ${nm}-del ) 
            echo rm -rf ${BLG_DIR}/${nm} 
            #echo mkdir ${BLG_DIR}/${nm} 
        ;; 
        ${nm}-n | ${nm}-new ) 
            echo nikola init --demo ${BLG_DIR}/${nm} 
            #echo cp ${top_nk}/n1/${nm}/conf.py ${BLG_DIR}/${nm}
        ;;
        ${nm}-n-b | ${nm}-new-bld | ${nm}-bld ) echo "cd ${BLG_DIR}/${nm}; nikola build" ;;
        ${nm}-s | ${nm}-srv | ${nm}-new-bld-srv ) echo "cd ${BLG_DIR}/${nm}; nikola serve" ;;
    esac

}
n1a_main "$@"
