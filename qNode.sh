#!/usr/bin/env bash
# Author: Michael Calvey
# Version: 0.1


echo "Please enter a project name: "
read project_name
echo "Starting project creation with name " "$project_name" "..."
echo
echo

# Initial express installation at requested dir
echo "Installing NPM..."
npm install express -g
echo "Initializing express project under $project_name"
express --view=ejs $project_name
cd $project_name
npm install
echo "First step done, installing packages"
echo
echo

# Installs additional required packages
echo "Installing nodemon"
npm install nodemon --save
echo "Installing ejs"
npm install ejs --save
npm install express-layouts
npm install express-layouts-ejs
echo "Initial packages installed"
echo
echo

# README and LICENSE
echo "Generating README and LICENSE"
touch README.md
touch LICENSE
echo "Downloading apache 2.0 license"
curl -sS https://github.com/laher/wget-go/blob/master/LICENSE >> LICENSE
echo "##" + $project_name >> README.md
echo "README and LICENSE complete."
echo
echo


# Git setup
echo "Initializing git..."
git init
git add-commit -m "First commit"
echo
echo "git is now ready to be linking with github. This must be done manually."
echo
echo


echo "Starting database creation. Please enter the following four commands:"
echo
echo "create database $project_name\_development"
echo "create database $project_name\_test"
echo "create database $project_name\_production"
echo "\q"
psql
echo "Database created"
echo
echo


echo "Script has been completed"

