(emux-session-set-default-directory "~/code/user-portal")
(emux-screen-create '(:name "guard") "guard" "be guard")
(emux-screen-create '(:name "tail" :no-terminal t))
(itail "tail -f log/development.log")
