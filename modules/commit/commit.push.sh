__legit_commit_push () {

    local currentBranch=`git rev-parse --abbrev-ref HEAD`
    local pendingCommits=`git log --branches --not --remotes --decorate --oneline`

    clear

    echo -e "${INFO}Now, we can try to push those file !";
    echo -e "${INFO}If your remote server is properly set, this will be easy peasy captain !";

    echo -e "${INVITE}Do you want to push ?";
    read -e doPush
    case $doPush in
        [yY]|[yY][eE][sS]) {
            # local pushStatementOutput=$(git push origin ${currentBranch} 2>&1)
            git push

            # if grep -q "Everything up-to-date" <<< "$pushStatementOutput" ; then
            #     echo -e "${INFO}You got nothing to push captain !";
            # else
            #     if grep -q "fetch first" <<< "$pushStatementOutput" ; then
            #         echo -e "${WARN}It seems your local repo is not upto date";
            #     fi

            #     if grep -q "Writing objects: 100%" <<< "$pushStatementOutput" ; then
            #         echo -e "${INFO}Everything went right !";
            #         echo -e "${INFO}Your code is now synced with remote server.";
            #     else
            #         echo -e "${WARN}Something went wrong !";
            #         echo -e "${WARN}You know what captain ? I\'m not able to tell you what ...";
            #         echo -e "${WARN}I got you the log :";
            #         echo $pushStatementOutput
            #     fi
            # fi
        };;
        [nN]|[nN][oO]) {
            echo -e "${INFO}Alright captain ! You're free to do that later by yourself";
            __legit_commit_pending
        };;
        *) {
            echo -e "${WARN}${LRED}You serious man ? type \"yes\" or \"no\" ... no big deal !${RESTORE}"
        };;
    esac
}