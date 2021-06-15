#
# Global Informations
#
BLG_DIR="blg"
DOC_DIR="docs"

function gbl_main(){
    echo "# FuncName " ${FUNCNAME[0]}

    local nm=gbl

    case "$1" in
        ${nm}-nfo ) 
            ${Run} "BLG_DIR : "$BLG_DIR
        ;;
        ${nm}-hlp )
            ${Run} ${nm}-hlp 
        ;; 
    esac

}
gbl_main "$@"