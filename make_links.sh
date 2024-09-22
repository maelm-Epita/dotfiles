#!/bin/bash

# get all .config subdirs
confdirs=($(cd ./.config/ && ls -d * ))
# all config files not in .config subdirs
conffiles=(".bashrc" ".bash_aliases")

# introduction
echo ":: This program will set up symlinks for each dotfile."
echo ":: Directories to symlink : ${confdirs[@]}"
echo ":: Files to symlink : ${conffiles[@]}"

# get user options
while [[ !( "$backups" =~ y|Y|n ) ]] 
do
  read -p ":: would you like to make backups of existing configurations [Y/n]: " backups
  backups=${backups:-y}
done
while [[ !( "$print" =~ y|Y|n ) ]] 
do
  read -p ":: would you like to print the created symlinks to the terminal [Y/n]: " print
  print=${print:-y}
done
# set options to user defined options
options=( -s -r )
if [[ "$backups" =~ y|Y ]]
then
  options+=( -b )
else
  options+=( -f )
fi
if [[ "$print" =~ y|Y ]]
then
  options+=( -v )
fi

# create symlinks for bashrc and aliases
for file in "${conffiles[@]}"
do
  ln "${options[@]}" ./${file} $HOME/${file}
done

# declaring backup function to backup if it exists and print it
backup_dir(){
  if [[ -d $HOME/.config/${1} ]]
  then
    mv $HOME/.config/${1} $HOME/.config/${1}~
    echo ":: backed up existing ${1} configuration to ${1}~"
  fi
}
# backup or remove existing config directories (ln doesnt overwrite existing directories)
if [[ "$backups" =~ y|Y ]]
then
  for dir in "${confdirs[@]}"
  do
    backup_dir "$dir"
  done
else
  for dir in "${confdirs[@]}"
  do
    rm -rf $HOME/.config/${dir}
  done
fi

# create config directory symlinks
for dir in "${confdirs[@]}"
do
  ln "${options[@]}" ./.config/${dir} $HOME/.config/${dir}
done

echo ":: Summary:"
if [[ "$backups" =~ y|Y ]]
then
  echo -e "::\tCreated $((${#confdirs[@]} + ${#conffiles[@]})) backups"
else
  echo -e "::\tRemoved $((${#confdirs[@]} + ${#conffiles[@]})) already existing files/directories"
fi
echo -e "::\tCreated $((${#confdirs[@]} + ${#conffiles[@]})) symlinks"
