array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}



status () {
  clear

  local currentBranch=`git rev-parse --abbrev-ref HEAD`

  local listOfAddedFiles=`git diff --cached --name-only`
  local listOfModifiedFilesFiles=`git diff --diff-filter=M --name-only`
  local listOfUntrackedFilesFiles=`git ls-files --others --exclude-standard`

  echo -e "${INFO}Your are on branch ${PURPLE}\"${currentBranch}\"${RESTORE}"

    if [ "$listOfAddedFiles" != "" ]; then {
        local filesDeleted=`git status --porcelain | awk 'match($1, "D"){print $2}'`

        echo -e "${INFO}Changes to be committed:"

        for i in $listOfAddedFiles; do
            array_contains filesDeleted ${i} && echo -e "${INFO}---  ${CYAN}${i} ${RESTORE} ${RED}DELETED${RESTORE}" || echo -e "${INFO}---  ${CYAN}${i} ${RESTORE}"
        done

        echo -e "${INFO}${LBLUE}===================================================${RESTORE}"
    } fi
    if [ "$listOfModifiedFilesFiles" != "" ]; then {
        local filesModifiedByBoth=`git diff --diff-filter=U --name-only`

        echo -e "${INFO}Changes not staged for commit:"

        for i in $listOfModifiedFilesFiles; do
            array_contains filesModifiedByBoth ${i} && echo -e "${INFO}---  ${YELLOW}${i} ${RESTORE} ${RED}BOTH MODIFIED${RESTORE}" || echo -e "${INFO}---  ${YELLOW}${i} ${RESTORE}"
        done

        echo -e "${INFO}${LBLUE}===================================================${RESTORE}"
    } fi
    if [ "$listOfUntrackedFilesFiles" != "" ]; then {
        echo -e "${INFO}Untracked files:"

        for i in $listOfUntrackedFilesFiles; do
            echo -e "${INFO}---  ${RED}${i} ${RESTORE}"
        done

        echo -e "${INFO}${LBLUE}===================================================${RESTORE}"
    } fi

    if [ "$1" == "-c" ]; then {
      __legit_commit_pending
    } fi
}