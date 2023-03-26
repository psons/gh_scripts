#!/bin/ksh
#ghRepo3.sh
# Uses d and the 2 parent directories of cwd to create a repo name
# creates that repo on github
# the name of the repo canbe a simple name witnout .git or tmy user path.
# apparently the login is inferred from the access token used for gh auth login 
# see google doc 'git/auth and gh cli for github'
# To make this work, I:
#   used bome brew to install the gh cli
#   created a personal access token wit "repo" and "'read:org'"
#   ran:
#       gh auth login # and supplied the personal access token
d=$(basename $(pwd))
d1=$( basename $(dirname $(pwd)))
d2=$(basename $(dirname  $(dirname $(pwd))))
reponame="${d2}_${d1}_${d}"
echo $reponame

# https://cli.github.com/manual/gh_repo_create 
if git rev-parse --is-inside-work-tree 2>&1 > /dev/null
then
    ${HOMEBREW_PREFIX}/bin/gh repo create ${reponame} --source=. --public --remote github 
else
    echo "Not in a git repo. ( $(pwd))"
fi
