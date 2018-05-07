#!/bin/sh

basepath=~/coding/git/

gitStatus() {
  $git status -su
}

gitBranchStatus() {
  $git status -sb | head -n 1 | cut -d' ' -f 3-
}

gitCurrentBranch() {
  $git branch | grep "* " | cut -d' ' -f 2
}

printStatus() {
  s=$(gitStatus)
  if [ "$s" ]; then
    gitStatus
  fi
}

printBranchStatus() {
  s=$(gitBranchStatus)
  if [ "$s" ]; then
    echo "$s"
  fi
}

setGitVar() {
  git="git --git-dir=$gitdir --work-tree=$dir"
}

fetchAll() {
  $git fetch --all > /dev/null
}

printRepoInfo() {
  case $(gitCurrentBranch) in 
    *master*)
      if [ "$(gitStatus)" -o "$(gitBranchStatus)" ]; then
        echo $dir
        printBranchStatus
        printStatus
        echo
      fi
    ;;
    *)
      echo $dir
      echo "*** not on master branch ***"
      printStatus
      echo
    ;;
  esac
}

dirs=$basepath"*/" 
for f in $dirs 
do
  dir=$f
  gitdir=$dir".git"
  if [ -d $gitdir ]; then
    setGitVar
    fetchAll
    printRepoInfo
  else
    subDirs=$dir"*/"
    for f2 in $subDirs 
    do
      dir=$f2
      gitdir=$dir".git"
      setGitVar
      fetchAll
      printRepoInfo
    done
  fi
done
