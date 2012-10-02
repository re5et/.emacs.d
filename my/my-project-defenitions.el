(simp-project-define
 '(:type rails
   :has (config.ru app/views app/models app/controllers)
   :ignore (tmp coverage log vendor .git .css private public)))

(simp-project-define
 '(:type node
   :has (node_modules)))

(simp-project-define
 '(:type thoughtstream
   :has (node-app rails-app npTuioClient)
   :ignore (db docs .git ios-app npTuioClient scripts shared rails-app/public/javascripts node-app/node_modules shared .jhw-cache rails-app/tmp rails-app/public)))

(simp-project-define
 '(:type emacs
   :has (init.el)))

(provide 'my-project-defenitions)
