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
   '(:type git
           :has (.git)
           :ignore (.git)))

  (simp-project-define
   `(:type rails
           :has (config.ru app/views app/models app/controllers)
           :ignore ,rails-ignore))

  (simp-project-define
   '(:type node
           :has (node_modules)))

  (simp-project-define
   `(:type thoughtstream
           :has (npTuioClient)
           :ignore ,(append
                     (mapcar (lambda (x) (intern (format "rails-app/%s" x))) rails-ignore)
                     '(db docs .git ios-app npTuioClient scripts shared node-app/node_modules shared))))

  (simp-project-define
   '(:type emacs
           :has (init.el)
           :ignore (.git))))

(provide 'my-project-defenitions)
