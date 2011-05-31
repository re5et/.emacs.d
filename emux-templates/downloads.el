;; create new screen, setting pwd to /other/downloads
;; naming initial terminal "dowload-dir" and run command "lm"
(emux-create-screen nil "/other/downloads" "download-dir" "lm")

;; split horizontally and name new terminal "sb
;; run command "ssh sb"
(emux-hsplit "sb" "ssh sb")

;; run command on above created terminal
(emux-terminal-command "ls d/ --sort time -r")

;; split vertically and name terminal scp
;; setup scp and trigger remote autocomplete
(emux-vsplit "scp")
(emux-send-to-terminal "scp -r sb:d/")
