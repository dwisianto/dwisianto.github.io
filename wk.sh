#
# Input Arguments
#
top_args=$@ && echo " # Top Args : $top_args"


#
# Mode of Operations
#
Run0 (){ echo "# $@" ; }
Run1 (){ echo "# $@" ; "$@" | bash ; } 
Run2 (){ echo "# ${@/eval/}" ; "$@" ; }
Run=$( [[ $1 == *- ]] && echo "Run1" || echo "Run0" )
echo "# Run:"${Run}


#
#
#
top_wk=./wk
top_os=${top_wk}/os
top_ss=${top_wk}/ss
top_nk=${top_wk}/nk
top_md=${top_wk}/md

top_wt=./wt
top_pg=${top_tt}/page
top_ps=${top_wt}/post

#
# conda info --envs
# conda activate nk21s
#

#. ${top_ss}/gt/g_branch.sh $top_args
#. ${top_ss}/gt/g_master.sh $top_args
#. ${top_ss}/gt/g_page.sh $top_args



#
#
#
. ${top_ss}/gbl/g2a_global.sh $top_args
. ${top_ss}/gbl/g2b_main.sh $top_args
. ${top_ss}/gbl/g2c_anaconda.sh $top_args

#. ${top_ss}/gt/g_branch.sh $top_args
#. ${top_ss}/gt/g_master.sh $top_args
#. ${top_ss}/gt/g_page.sh $top_args

#
#
#
. ${top_nk}/n1/n1a/n1a.sh $top_args
. ${top_nk}/n9/n9a/n9a.sh $top_args
. ${top_nk}/n9/n9b/n9b.sh $top_args
. ${top_nk}/n9/n9c/n9c.sh $top_args


#
# References
# https://www.brainsorting.com/posts/create-a-blog-with-nikola/
#

# conda activate nk21, 
# wk.sh wk 