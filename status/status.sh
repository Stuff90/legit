
status () {
  local currentBranch=`git rev-parse --abbrev-ref HEAD`

  local listOfAddedFiles=`git diff --cached --name-only`
  local listOfModifiedFilesFiles=`git ls-files -m`
  local listOfUntrackedFilesFiles=`git ls-files --others --exclude-standard`

  echo -e "${INFO}Your are on branch ${PURPLE}\"${currentBranch}\"${RESTORE}"

  if [ "$listOfAddedFiles" != "" ]; then {
    echo -e "${INFO}Changes to be committed:"
    for i in $listOfAddedFiles; do
      echo -e "${INFO}---  ${CYAN}${i} ${RESTORE}"
    done
    echo -e "${INFO}========================================";
  } fi
  if [ "$listOfModifiedFilesFiles" != "" ]; then {
    echo -e "${INFO}Changes not staged for commit:"
    for i in $listOfModifiedFilesFiles; do
      echo -e "${INFO}---  ${YELLOW}${i} ${RESTORE}"
    done
    echo -e "${INFO}========================================";
  } fi
  if [ "$listOfUntrackedFilesFiles" != "" ]; then {
    echo -e "${INFO}Untracked files:"
    for i in $listOfUntrackedFilesFiles; do
      echo -e "${INFO}---  ${RED}${i} ${RESTORE}"
    done
    echo -e "${INFO}========================================";
  } fi

}