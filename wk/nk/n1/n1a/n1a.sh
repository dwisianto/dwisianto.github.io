
n1a_Activate(){
    echo conda activate nk21 
}

n1a_Del(){
    echo rm -rf ${BLG_DIR}/${nm}
}

n1a_New(){

    echo nikola init --quiet  ${BLG_DIR}/${nm}  
    echo cp ${top_nk}/${tg}/${nm}/conf.py ${BLG_DIR}/${nm}  
    echo cp ${top_wt}/pages/* ${BLG_DIR}/${nm}/pages
    echo cp -rf ${top_wt}/posts/* ${BLG_DIR}/${nm}/posts    
    echo cp -rf ${top_wt}/files ${BLG_DIR}/${nm}

}

n1a_Build(){
    echo "cd ${BLG_DIR}/${nm}; nikola build"
}

n1a_Serve(){
    echo "cd ${BLG_DIR}/${nm}; nikola serve"
}

n1a_Edit(){
    echo "cd ${BLG_DIR}/${nm}; nikola new_post -f markdown -d "
    echo "cd ${BLG_DIR}/${nm}; nikola new_page -f markdown"
}

n1a_Routine(){
    ${nm}_Del 
    ${nm}_New
    ${nm}_Build
    ${nm}_Serve
}

n1a_Docs() {
    echo "cp -rf ${BLG_DIR}/${nm} ${DOCS}"
}



#     echo "# FuncName " ${FUNCNAME[0]}
n1a_main(){
    local tg=n1 #tag
    local nm=${tg}a #name

    case "$1" in
        ${nm}-a | ${nm}-act )  ${nm}_Activate ;;
        ${nm}-d | ${nm}-del ) ${nm}_Del ;; 
        ${nm}-n | ${nm}-d-n | ${nm}-new ) ${nm}_New ;;
        ${nm}-b | ${nm}-d-n-b | ${nm}-new-bld | ${nm}-bld ) ${nm}_Build ;;
        ${nm}-s | ${nm}-d-n-b-s | ${nm}-new-bld-srv ) ${nm}_Serve ;;
        ${nm}-e )  ${nm}_Edit ;; 
        wk | wk-r | ${nm}-r ) ${nm}_Routine ;;
        wk-o | wk-u | ${nm}-o | ${nm}-u ) ${nm}_Docs ;; 

        *  )  
            echo '#' ${tg}
            echo '#' ${nm}
            echo '#' -a : activate 
            echo '#' -d : delete
            echo '#' -d-n : new
            echo '#' -d-n-b-s : build
            echo '#' -d-n-b-s : serve
            echo '#' -o : output to docs
        ;;
    esac
    
}
n1a_main "$@"





#
# NAVIGATION_LINKS 
#

#
#
#
#  pagination
# INDEX_DISPLAY_POST_COUNT = 1
#



#
# Data about this site
# BLOG_AUTHOR = "Dwi Sianto"  # (translatable)
# BLOG_TITLE = "Elfant's Note"  # (translatable)
# This is the main URL for your site. It will be used
# in a prominent link. Don't forget the protocol (http/https)!
# SITE_URL = "https://example.com/"
# This is the URL where Nikola's output will be deployed.
# If not set, defaults to SITE_URL
# BASE_URL = "https://example.com/"
# BLOG_EMAIL = "dwisianto@gmail.com"
# BLOG_DESCRIPTION = "Read Write and Repeat"  # (translatable)




#
#https://getnikola.com/creating-a-site-not-a-blog-with-nikola.html
#POSTS 
#PAGES   
#INDEX_PATH="blog"   
#
# .. has_math: true
# USE_KATEX = True
# KATEX_AUTO_RENDER = """





  

#
# nikola plugin -i publication_list
# https://plugins.getnikola.com/v7/publication_list/
# https://github.com/bishesh/bishesh.github.io/tree/src
#
