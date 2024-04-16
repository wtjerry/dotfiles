#!/bin/bash

check_if_remote_specified=$1

all_basepaths=($HOME/coding/git/ $HOME/ctf/)
max_depth=4
direct_repo_paths=($HOME/)


git_status() { git status -su ; }

git_branch_status() { git status -sb | head -n 1 | cut -d' ' -f 3- ; }

git_current_branch() { git branch --show-current ; }

has_remote() { if [ -z "$(git remote)" ]; then return 1; fi ; }

is_not_on_main() { 
    if [ "$(git_current_branch)" = "main" ] || [ "$(git_current_branch)" = "master" ];
        then return 1;
    fi ;
}

fetch_if_remote() { if has_remote ; then git fetch > /dev/null; fi ; }

check_for_main_branch_or_warn() { if is_not_on_main; then echo "*** not on main/master branch ***"; fi ; }

check_for_remote_or_warn() { if ! has_remote ; then echo "*** no remote configured ***"; fi ; }

anything_to_report() {
    if [ "$(git_status)" ] || \
       [ "$(git_branch_status)" ] || \
       is_not_on_main; then
        return 0
    elif [ -n "$check_if_remote_specified" ] && ! has_remote ; then
        return 0 
    else
        return 1
    fi
}

try_print_dir() {
    local gitdir=$dir".git"
    if [ -d "$gitdir" ]; then
        cd "$dir"
        if anything_to_report ; then
            echo "$dir"
            check_for_main_branch_or_warn
            check_for_remote_or_warn
            fetch_if_remote
            git_branch_status
            git_status
            echo
        fi
    else
        return 1
    fi
}

recursive_try_print_dir() {
    local dirs=$dir"*/"
    for dir in $dirs; do
      if ! try_print_dir ; then
          if [ "$1" -lt $max_depth ]; then
              recursive_try_print_dir $(($1 + 1))
          fi
      fi
    done
}

main() {
    # print info for all $direct_repo_paths
    for dir in "${direct_repo_paths[@]}"; do
        try_print_dir
    done

    # print info for all $all_basepaths
    for dir in "${all_basepaths[@]}"; do
        recursive_try_print_dir 0
    done
}

prev_working_dir=$(pwd)
main
cd "$prev_working_dir"
