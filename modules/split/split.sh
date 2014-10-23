function split () {
    # local cmd=""
    # local cdto="$PWD"
    # local args="$@"

    # if [ -d "$1" ]; then
    #     cdto=`cd "$1"; pwd`
    #     args="${@:2}"
    # fi

    # if [ -n "$args" ]; then
    #     cmd="; $args"
    # fi

    osascript &>/dev/null <<EOF
    tell application "iTerm"
        tell the current terminal
            tell the current session
                tell i term application "System Events" to keystroke "d" using command down
            end tell
        end tell
    end tell
EOF
}


