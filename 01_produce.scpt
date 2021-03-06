#!/usr/bin/osascript
on run argv
  set BASEDIR to item 1 of argv as string
  tell application "iTerm2"
    # open first terminal and produce
    tell current session of current tab of current window
        write text "cd " & BASEDIR
        write text "bash ./01-1_produce.sh"
        split horizontally with default profile
        #split vertically with default profile
    end tell
    # open second terminal and produce
    tell second session of current tab of current window
        write text "cd " & BASEDIR
        write text "bash ./01-2_consume.sh"
        split vertically with default profile
    end tell
    # open second terminal and consume
    tell third session of current tab of current window
        write text "cd " & BASEDIR
        write text " bash ./01-3_consume.sh"
    end tell
  end tell
end run