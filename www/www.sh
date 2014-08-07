
www () {
  clear
  if [[ -z "$1" ]]
    then
      cd /Applications/MAMP/htdocs
    else
      if [ "$1" == "-g" ]; then
          cd /Applications/MAMP/htdocs/${2}
          status
        else
          cd /Applications/MAMP/htdocs/${1}
      fi
  fi
}