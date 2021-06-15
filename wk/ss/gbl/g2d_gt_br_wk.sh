

gt_br_wk_act(){

    local nm=gt_br_wk

    case "$1" in
        ${nm}-nfo ) echo ${nm} ;;
        ${nm}-upstream ) 
            echo "git branch --set-upstream-to=origin/wk wk" 
            echo "git push --set-upstream origin wk"
        ;;
    esac

}
gt_br_wk_act "$@"
