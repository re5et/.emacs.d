(emux-session-define-template
 system
 (emux-session-set-default-directory "~/")
 (emux-screen-create '(:name "system"))
 (emux-term-hsplit "bmon" "bmon")
 (emux-term "free space" "watch df -h")
 (other-window 1)
 (proced)
 (other-window 1)
 (delete-window))

(provide 'my-emux-templates)
