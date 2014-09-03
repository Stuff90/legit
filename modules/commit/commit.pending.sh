__legit_commit_pending () {

    local pendingCommits=`git log --branches --not --remotes --decorate --oneline`


	if [ "$pendingCommits" != "" ]; then {
    	local currentBranch=`git rev-parse --abbrev-ref HEAD`

	    echo -e "${INFO}Here is the list of your pending commit on branch ${PURPLE}\"${currentBranch}\"${RESTORE}";
	    git log --branches --not --remotes --decorate --oneline
	    echo -e "${INFO}${LBLUE}===================================================${RESTORE}"
	} fi

}

# To git@github.com:Stuff90/test.git
#  ! [rejected]        master -> master (fetch first)
# error: failed to push some refs to 'git@github.com:Stuff90/test.git'
# hint: Updates were rejected because the remote contains work that you do
# hint: not have locally. This is usually caused by another repository pushing
# hint: to the same ref. You may want to first integrate the remote changes
# hint: (e.g., 'git pull ...') before pushing again.
# hint: See the 'Note about fast-forwards' in 'git push --help' for details.