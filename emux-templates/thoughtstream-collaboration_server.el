(emux-session-set-default-directory "~/code/thoughtstream-collaboration_server/")
(emux-screen-create '(:name "git") "git" "git status")
(emux-screen-create '(:name "misc") "misc" "ls")
(emux-screen-create '(:name "tail"))
(itail "log/development.log")
(emux-screen-create '(:name "guard") "guard" "be guard --notify false")
