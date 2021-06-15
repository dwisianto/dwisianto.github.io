

gt_br_docs_act(){

    local nm=gt_br_docs

    case "$1" in
        ${nm}-new ) ${Run} conda create --name nk21 python=3.8.5 ;;
        ${nm}-act ) ${Run} conda activate nk21 ;;
    esac

}
gt_br_docs_act "$@"