


function ac_main(){

    local nm=ac

    case "$1" in
        ${nm}-new ) ${Run} conda create --name nk21 python=3.8.5 ;;
        ${nm}-act ) ${Run} conda activate nk21 ;;
    esac

}
ac_main "$@"
