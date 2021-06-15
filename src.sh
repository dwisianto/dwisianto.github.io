




top_Act(){

    case "$1" in
        * ) 
            echo "rm -rf docs"
            echo "cp -rf blg/n1a/output docs" 
        ;;
    esac
}
top_Act "$@"