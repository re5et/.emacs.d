(let
    ((rails-ignore '(tmp
                     coverage
                     log
                     vendor
                     .git
                     .css
                     private
                     public
                     .jhw-cache)))

  (simp-project-define
   `(:type rails
           :has (config.ru app/views app/models app/controllers)
           :ignore ,rails-ignore))

  (simp-project-define
   '(:type node
           :has (node_modules)
           :ignore (.git log node_modules .bundle vendor)))

  (simp-project-define
   '(:type git
           :has (.git)
           :ignore (.git)))

  (simp-project-define
   '(:type emacs
           :has (init.el)
           :ignore (.git))))

(provide 'my-project-defenitions)
