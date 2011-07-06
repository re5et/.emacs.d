(emux-set-session-pwd "/other/downloads")
(emux-create-screen nil "download-dir" "lm")
(emux-hsplit "sb" "ssh sb")
(emux-terminal-command "ll d/ --sort time -r")
(emux-vsplit "scp")
(emux-send-to-terminal "scp -r sb:d/")

default-directory
