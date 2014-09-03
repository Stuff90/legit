__legit_commit_commit () {

    local currentBranch=`git rev-parse --abbrev-ref HEAD`
    local listOfAddedFiles=`git diff --cached --name-only`

    status
    echo -e "${INVITE}Do you want to commit changes above on branch ${PURPLE}\"${currentBranch}\"${RESTORE} (yes/no?): "
    read -e doCommit
    case $doCommit in
        [yY]|[yY][eE][sS]) {
            clear
            # IF List of files updated IS NOT NULL
            if [ "$listOfAddedFiles" != "" ]; then {
                echo -e "${INFO}Alright, let's do this !"

                git status >> ~/commit.log 2>&1
                status

                echo -e "${INFO}There you go"; echo -e "${INVITE}Please write down the commit message"; echo -e "${INVITE}And please no funny business - commit is not something to play with"
                read

                git commit -m "${currentBranch} * $REPLY" >> ~/commit.log 2>&1

                echo -e "${INFO}Hey captain, job's done !"; echo -e "${INFO}Your commit has been sent by the the followinf name"; echo -e "${INFO}${LBLUE}***${RESTORE} ${currentBranch} $REPLY"
                echo -e "${INFO}Fancy isn't it ?";

                echo -e "${INVITE}Wanna see logs ? (yes)"
                read -t 1.5 showLog

                case $showLog in
                    [yY]|[yY][eE][sS]) {
                        vi ~/commit.log
                    };;
                    *) {
                        echo -e "${INFO}No log this time";
                        echo -e "${NOTICE}You can find the log in file ${PURPLE}~/commit.log${RESTORE}";
                    };;
                esac
                __legit_commit_push
            # ESLE List of files updated IS NULL
            } else {
                echo -e "${WARN}You have nothing to commit, look :"
                status
            } fi
            # ENDIF
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