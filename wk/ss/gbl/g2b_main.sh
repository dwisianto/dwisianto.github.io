
main_act(){
    local nm="main"

    case "$1" in
        ${nm}-nfo ) echo "main info" ;;
    esac
}
main_act "$@"