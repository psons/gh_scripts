#!/bin/ksh
#ghRepo3.sh
# Uses the 3 st directory of cwd to create a repo name
# creates that repo on github
# the name of the repo can be a simple name witnout .git or tmy user path.
# apparently the login is inferred from the access token used for gh auth login 
# see google doc 'git/auth and gh cli for github'
# To make this work, I:
#   used bome brew to install the gh cli
#   created a personal access token wit "repo" and "'read:org'"
#   ran:
#       gh auth login # and supplied the personal access token
reponame=$(basename $(pwd))
echo $reponame

# https://cli.github.com/manual/gh_repo_create 
if git rev-parse --is-inside-work-tree 2>&1 > /dev/null
then
    echo ${HOMEBREW_PREFIX}/bin/gh repo create ${reponame} --source=. --public --remote github 
else
    echo "Not in a git repo. ( $(pwd))"
fi
