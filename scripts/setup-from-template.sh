#!/usr/bin/env bash

## inspired by: https://blog.danslimmon.com/2019/07/15/do-nothing-scripting-the-key-to-gradual-automation/

# Ensure we're running from inside scripts
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

echo "This is a series of steps (partially automated) to setup the repo from it's template."

if ! command -v jq &> /dev/null
then
    echo "jq could not be found. See: https://formulae.brew.sh/formula/jq on OSX."
    exit 1
fi

echo "Please commit any unstaged or stages before you proceed."
read  -n 1 -p "Press y to proceed:" confirm1
case $confirm1 in
[yY])
    echo "\n Proceeding..."
    ;;
*)
    echo "Exiting."
    exit 0
    ;;
esac


# Step 1: Remove template changelog and configuration
echo "Step 1 (Automated): Setup versioning."
echo "Deleting .versionrc.js" 
rm -f ../.versionrc.js
echo "Deleting old CHANGELOG.md" 
rm -f ../CHANGELOG.md

# Step 2: Update project name
echo "Step 2 (Automated): Setup Project Name."
echo "Please enter the name of your project."
read  -p "Please press enter your project name to proceed (n to exit):" projectname
case $projectname in
[Nn])
    echo "Exiting."
    exit 0
    ;;
*)
    mv ../.github/workflows/.publish.deactivated ../.github/workflows/publish.yml
    jq -c '.name = $projectname' --arg projectname $projectname ../package.json > tmp.$$.json && mv tmp.$$.json ../package.json
    rm -f tmp$$.json
    sed -i '' "s/example-library/$projectname/g" ../.log4brains.yml # -i '' is OSX specific!
    ;;
esac


# Step 3: Commit changes
echo "Step 3 (Automated): Committing changes"
read  -n 1 -p "Please press y to proceed:" confirm3
case $confirm3 in
[Yy])
    rm -f -- "$0"
    git add ../
    git commit -m "chore: setup $projectname from template"
    ;;
*)
    echo "Exiting."
    exit 0
    ;;
esac

echo "Step 4 (Manual): Pushing changes"
echo "In a new terminal, please push your changes with the following command"
echo "git push origin"
read  -p "Please press any key when this is complete:" confirm4


echo "Step 5 (Manual): Add Repo to Confluence"
echo "Visit https://perfectward.atlassian.net/wiki/spaces/EN/pages/924909569/Repositories and add your new library and repo to the document"
read  -p "Please press any key when this is complete:" confirm5