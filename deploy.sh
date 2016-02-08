#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub Pages Site...\033[0m"

# Build the public site
hugo
# if using a theme, replace with `hugo -t <yourtheme>`

# Go to Public folder
cd public
# Add changes to git
git add -A

# Commit changes
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push changes to public repo on GitHub
git push

# Come back to top level of content repo
cd ..
