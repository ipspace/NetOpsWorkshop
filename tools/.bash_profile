parse_git_branch ()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

_git-tree-branch ()
{
  changed=$(git -c color.status=always status -s)
  if [ -n "$changed" ] ; then
    printf -v line "%*s" 50 ""
    printf "In %s:\n%s\n" "$PWD" ${line// /-}
    printf "%s\n\n" "$changed"
  fi
}

git-tree ()
{
  count=$(find "${1:-.}" -name '.git' -print | wc -l)
  if [ $count -ne 0 ] ; then
    export -f _git-tree-branch
    find "${1:-.}" -name '.git' -execdir bash -c _git-tree-branch "$PWD" \;
  else
    echo "No Git repositories found within specified directory path"
  fi
}

export PS1='\u \[\033[33m\]\W\[\033[32m\]$(parse_git_branch)\[\033[00m\] $ '
