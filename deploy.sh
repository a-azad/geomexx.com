#!/bin/sh

# If a command fails then the deploy stops
set -e

# delete docs folder
rm -rf docs

# Go to builder folder
cd www

# Build the project.
# if using a theme, replace with `hugo -t <YOURTHEME>`
hugo

cd ..

# # Add changes to git.
git add -A

# # Commit changes.
 msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# # Push source and build repos.
git push origin master