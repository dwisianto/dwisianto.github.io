


function n1c_main(){

    local nm=n1c

    case "$1" in
        ${nm}-new ) echo nikola init ${OUT_DIR}/${nm} -q ;;
        ${nm}-new-bld | ${nm}-bld ) echo "cd ${OUT_DIR}/${nm}; nikola build" ;;
        ${nm}-new-bld-srv ) echo "cd ${OUT_DIR}/${nm}; nikola serve" ;;
    esac

}
n1c_main "$@"
