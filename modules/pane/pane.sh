function pane () {

    case $1 in
        "-sv") {
            local cmd=""
            local cdto="$PWD"
            local args="$@"

            if [ -d "$1" ]; then
                cdto=`cd "$1"; pwd`
                args="${@:2}"
            fi

            if [ -n "$args" ]; then
                cmd="; $args"
            fi

            osascript &>/dev/null <<EOF
                tell application "iTerm"
                    tell the current terminal
                        tell the current session
                            tell i term application "System Events" to keystroke "d" using command down
                            write text "cd \"$cdto\"$cmd"
                        end tell
                    end tell
                end tell
EOF
        } ;;
        "-sh") {
            local cmd=""
            local cdto="$PWD"
            local args="$@"

            if [ -d "$1" ]; then
                cdto=`cd "$1"; pwd`
                args="${@:2}"
            fi

            if [ -n "$args" ]; then
                cmd="; $args"
            fi

            osascript &>/dev/null <<EOF
                tell application "iTerm"
                    tell the current terminal
                        tell the current session
                            tell i term application "System Events" to keystroke "D" using command down
                            write text "cd \"$cdto\"$cmd"
                        end tell
                    end tell
                end tell
EOF
        } ;;
        "-n") {
            osascript &>/dev/null <<EOF
                tell application "iTerm"
                    tell the current terminal
                        tell the current session
                            tell i term application "System Events" to keystroke "]" using command down
                        end tell
                    end tell
                end tell
EOF
        } ;;
        "-p") {
            osascript &>/dev/null <<EOF
                tell application "iTerm"
                    tell the current terminal
                        tell the current session
                            tell i term application "System Events" to keystroke "[" using command down
                        end tell
                    end tell
                end tell
EOF
        } ;;
        "-t") {
            local cmd=""
            local cdto="$PWD"
            local args="$@"

            if [ -d "$1" ]; then
                cdto=`cd "$1"; pwd`
                args="${@:2}"
            fi

            if [ -n "$args" ]; then
                cmd="; $args"
            fi

            osascript &>/dev/null <<EOF
                tell application "iTerm"
                    tell current terminal
                        launch session "Default Session"
                        tell the last session
                            write text "cd \"$cdto\"$cmd"
                        end tell
                    end tell
                end tell
EOF
        } ;;
        *) {
            echo -e "${WARN} ${LRED}You forgot the parameter !${RESTORE}"
            echo -e ""
            echo -e "${INFO} Here is the doc to make sur you don\'t miss anything next time captain"
            echo -e "${INFO}"
            echo -e "${INFO}    ${PURPLE}-sv${RESTORE}      ${LBLUE}split pane vertically${RESTORE}"
            echo -e "${INFO}    ${PURPLE}-sh${RESTORE}      ${LBLUE}split pane horizontally${RESTORE}"
            echo -e "${INFO}    ${PURPLE}-n${RESTORE}       ${LBLUE}move caret to next splitted pane${RESTORE}"
            echo -e "${INFO}    ${PURPLE}-p${RESTORE}       ${LBLUE}move caret to previous splitted pane${RESTORE}"
            echo -e "${INFO}"
            echo -e "${INFO}    ${PURPLE}-t${RESTORE}       ${LBLUE}open a new tab${RESTORE}"
        } ;;
    esac
}


