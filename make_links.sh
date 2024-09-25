#!/usr/bin/env bash

backupdir="$(pwd)/backup"
echo "$backupdir"

# introduction
echo ":: This program will set up symlinks for each dotfile of your chosen theme."
while [[ !("$theme" =~ arch|nixos )]]
do
  read -p ":: Choose a theme: " theme 
done
if ! cd "${theme}" ; then
    echo "Failed to enter folder ${theme}"
    echo "Aborting"
    exit 1
fi

# get all .config subdirs and files
dotconf=($(cd ./.config/ && ls -A ))
# get all home subdirs and files
dothome=($(cd ./home/ && ls -A ))
# go back
cd..


echo ":: .Config files and directories to symlink : ${dotconf[@]}"
echo ":: Home files and directories to symlink : ${dothome[@]}"
if [[ "$theme" == "nixos" ]]
then
  # get all nixos subdirs and files
  dotnix=($(cd ./nixos/ && ls -A ))
  echo ":: Nixos files and directories to symlink : ${dotnix[@]}"

  if [[ $(id -u) != 0 ]]
  then
    echo ":: Nixos theme requires root privileges, it will ask for your password during installation"
  fi
fi

# get user options
while [[ !( "$backups" =~ y|Y|n ) ]] 
do
  echo ":: Warning : The next option will overwrite any previous backups, if the previous backup was a nixos backup, you will need to provide your password for root permissions"
  read -p ":: would you like to create backups of existing configurations [Y/n]: " backups
  backups=${backups:-y}
done
while [[ !( "$print" =~ y|Y|n ) ]] 
do
  read -p ":: would you like to print the created symlinks to the terminal [Y/n]: " print
  print=${print:-y}
done
# modify things for user options
options=( -s -r )
if [[ ( "$backups" =~ y|Y ) ]]
then
  if [[ ( -d $backupdir )]]
  then
    sudo rm -rf "$backupdir"
  fi
  echo ":: making directory at $backupdir"
  mkdir "$backupdir"
else
  options+=( -f )
fi
if [[ "$print" =~ y|Y ]]
then
  options+=( -v )
fi

# create symlinks for bashrc and aliases
# for file in "${conffiles[@]}"
# do
#  ln "${options[@]}" ./${file} $HOME/${file}
# done

# declaring backup function to backup if it exists and print it
bcrmcount=0;
backup(){
  if [[ -e "${2}/${1}" ]]
  then
    if [[ ${2} == "/etc/nixos" ]]
    then
      # if nixos dir then sudo
      if ! (mkdir -p "${backupdir}/${3}" ; sudo -E mv "${2}/${1}" "${backupdir}/${3}/${1}")
      then
        echo ":: failed to backup file, aborting"
        exit 1
      else
        echo ":: backed up existing ${2}/${1} configuration to ${backupdir}/${3}/${1}"
        ((bcrmcount++))
      fi
    else
      # else dont sudo
      if ! (mkdir -p "${backupdir}/${3}" ; mv "${2}/${1}" "${backupdir}/${3}/${1}")
      then
        echo ":: failed to backup file, aborting"
        exit 1
      else
        echo ":: backed up existing ${2}/${1} configuration to ${backupdir}/${3}/${1}"
        ((bcrmcount++))
      fi
    fi
  else
    echo ":: file/directory ${2}/${1} doesnt exist, doesnt need backup, skipping..."
  fi
}
# backup or remove existing config directories and files (ln doesnt overwrite existing directories)
if [[ "$backups" =~ y|Y ]]
then
  # backup .config
  for el in "${dotconf[@]}"
  do
    backup "$el" "${HOME}/.config" ".config"
  done
  # backup home
  for el in "${dothome[@]}"
  do
    backup "$el" "${HOME}" "home"
  done
  if [[ "$theme" == "nixos" ]]
  then
    # backup nixos
    for el in "${dotnix[@]}"
    do
      backup "$el" "/etc/nixos" "nixos"
    done
  fi
else
  for el in "${dotconf[@]}"
  do
    rm -rf "$HOME/.config/${el}"
    ((bcrmcount++))
  done
  for el in "${dothome[@]}"
  do
    rm -rf "$HOME/${el}"
    ((bcrmcount++))
  done
  if [[ "$theme" == "nixos" ]]
  then
    for el in "${dotnix[@]}"
    do
      sudo -E rm -rf "/etc/nixos/${el}"
      ((bcrmcount++))
    done
  fi
fi

## todo
# create config directory symlinks
for dir in "${confdirs[@]}"
do
  ln "${options[@]}" ./.config/${dir} $HOME/.config/${dir}
done

# link
linkcount=0
for el in "${dothome[@]}"
do
  ln "${options[@]}" ./home/${el} "$HOME/${el}"
  ((linkcount++))
done
for el in "${dotconf[@]}"
do
  ln "${options[@]}" ./.config/${el} "$HOME/.config/${el}"
  ((linkcount++))
done
if [[ "$theme" == "nixos" ]]
then
  for el in "${dotnix[@]}"
  do 
    sudo ln "${options[@]}" ./nixos/${el} "/etc/nixos/${el}"
    ((linkcount++))
  done
fi

echo ":: Summary:"
if [[ "$backups" =~ y|Y ]]
then
  echo -e "::\tCreated $bcrmcount backups"
else
  echo -e "::\tRemoved $bcrmcount already existing files/directories"
fi
echo -e "::\tCreated $linkcount symlinks"

exit 0
