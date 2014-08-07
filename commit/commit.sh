
commit-effective () {

  local currentBranch=`git rev-parse --abbrev-ref HEAD`
  local listOfAddedFiles=`git diff --cached --name-only`

  status
  echo -e "${INVITE}Do you want to commit changes above on branch ${PURPLE}\"${currentBranch}\"${RESTORE} (yes/no?): "
  read
  case $REPLY in
         [yY]|[yY][eE][sS]) {
            clear
            if [ "$listOfAddedFiles" != "" ]; then {
              echo -e "${INFO}Alright, let's do this !"

              git status >> ~/commit.log 2>&1
              status

              echo -e "${INFO}There you go"; echo -e "${INVITE}Please write down the commit message"; echo -e "${INVITE}And please no funny business - commit is not something to play with"
              read

              git commit -m "${currentBranch} * $REPLY" >> ~/commit.log 2>&1

              echo -e "${INFO}Hey captain, job's done !"; echo -e "${INFO}Your commit has been sent by the the followinf name"; echo -e "${INFO}${LBLUE}***${RESTORE} ${currentBranch} $REPLY"
              echo -e "${INFO}Fancy isn't it ?"; echo -e "${INVITE}Wanna see logs ? (yes)(ENTER to skip)"
              read

              case $REPLY in
                [yY]|[yY][eE][sS]) {
                vi ~/commit.log
              }
              esac
            } else {
              echo -e "${WARN}You have nothing to commit, look :"
              status
            } fi
          };;
             [nN]|[nN][oO]) {
            clear
            echo -e "${WARN}${LRED}Nothing commited for now${RESTORE}, your move captain"; echo -e "${WARN}Have a look to your files (${PURPLE}\"${currentBranch}\"${RESTORE}) :"

            git status >> ~/commit.log 2>&1
            status
          };;
                         *) {
            echo -e "${WARN}${LRED}You serious man ? type \"yes\" or \"no\" ... no big deal !${RESTORE}"
          };;
  esac

}


commit () {
  clear

  date >> ~/commit.log


  if [ "$1" != "" ]; then {
    echo "" >> ~/commit.log

    if [ "$1" == "--b" ] || [ "$1" == "--branch" ]; then {

      if [ "$2" != "" ]; then {

        # Test if branch exist
        local exists=`git show-ref refs/heads/${2}`

        if [ -n "$exists" ]; then {

          local listOfAddedFiles=`git diff --cached --name-only`
          local listOfModifiedFilesFiles=`git ls-files -m`
          local listOfUntrackedFilesFiles=`git ls-files --others --exclude-standard`

          echo -e "${INFO}The branch ${PURPLE}\"${2}\"${RESTORE} already exists!"; echo -e "${INFO}Switching to branch ${PURPLE}\"${2}\"${RESTORE}"; echo ""

          git checkout ${2} >> ~/commit.log 2>&1

          git status >> ~/commit.log 2>&1
          status
          commit-effective

        } else {
          local currentBranch=`git rev-parse --abbrev-ref HEAD`

          echo -e "${WARN}The branch \"${2}\" does not exist.${RESTORE}"
          echo -e "${INVITE}Do you want to create it ?(yes/no)"
          read

          case $REPLY in
               [yY]|[yY][eE][sS]) {
                  echo -e "${INFO}The branch ${PURPLE}\"${2}\"${RESTORE} has been created"
                  git checkout -b ${2} >> ~/commit.log 2>&1
                  commit-effective
                };;
                   [nN]|[nN][oO]) {
                  echo -e "${INFO}The branch ${PURPLE}\"${2}\"${RESTORE} has ${LRED}not${RESTORE} been created"
                };;
                               *) {
                  echo -e "${WARN}${LRED}You serious man ? type \"yes\" or \"no\" ... no big deal !${RESTORE}"
                };;
          esac

        } fi

      } else {

        echo ""

      } fi

    } fi
    if [ "$1" == "--log" ]; then {
      vi ~/commit.log
    } fi
  } else {
    commit-effective
  } fi

  echo "" >> ~/commit.log
}
