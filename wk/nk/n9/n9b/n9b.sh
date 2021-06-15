





#     echo "# FuncName " ${FUNCNAME[0]}
function n1b_main(){

    # 
    local nm=n1b

    case "$1" in
        ${nm}-del ) echo " rm -rf ${BLG_DIR}/${nm} && mkdir ${BLG_DIR}/${nm} " ;;
        ${nm}-n | ${nm}-new ) 
            echo nikola init --quiet  ${BLG_DIR}/${nm}  
            echo cp ${top_nk}/n1/${nm}/conf.py ${BLG_DIR}/${nm} 
        ;;
        ${nm}-b | ${nm}-new-bld | ${nm}-bld ) echo "cd ${BLG_DIR}/${nm}; nikola build" ;;
        ${nm}-s | ${nm}-b-s | ${nm}-new-bld-srv ) echo "cd ${BLG_DIR}/${nm}; nikola serve" ;;
        ${nm}-e ) echo "cd ${BLG_DIR}/${nm}; nikola new_post -f markdown" ;; 
    esac

}
n1b_main "$@"
