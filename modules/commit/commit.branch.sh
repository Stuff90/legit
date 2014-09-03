__legit_commit_branch () {
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
          __legit_commit_commit

        } else {
          local currentBranch=`git rev-parse --abbrev-ref HEAD`

          echo -e "${WARN}The branch \"${2}\" does not exist.${RESTORE}"
          echo -e "${INVITE}Do you want to create it ?(yes/no)"
          read

          case $REPLY in
               [yY]|[yY][eE][sS]) {
                  echo -e "${INFO}The branch ${PURPLE}\"${2}\"${RESTORE} has been created"
                  git checkout -b ${2} >> ~/commit.log 2>&1
                  __legit_commit_commit
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
    __legit_commit_commit
  } fi

  echo "" >> ~/commit.log
}
