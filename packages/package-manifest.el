(require 'package)

(defgroup package-manifest nil
  "Install packages from a manifest."
  :group 'package-manifest)

(defcustom package-manifest
  nil
  "List of packages to install"
  :type '(repeat (symbol :tag "Package" ""))
  :group 'package-manifest)

(defun package-manifest-install-all ()
  (interactive)
  (package-refresh-contents)
  (if package-manifest
      (mapc
       'package-manifest-install
       package-manifest)
    (error "Package manifest is empty. Please set variable package-manifest to a list of package names")))

(defun package-manifest-install (package)
  (unless (package-installed-p package)
    (package-install package)))

(setq package-manifest
      '(auto-indent-mode
        autopair
        cm-mode
        coffee-mode
        color-theme
        css-mode
        emms
        expand-region
        flymake-coffee
        flymake-cursor
        flymake-easy
        flymake-ruby
        haml-mode
        highline
        ido-ubiquitous
        inf-ruby
        inflections
        itail
        javascript
        kill-ring-search
        lua-mode
        magit
        magit-commit-training-wheels
        markdown-mode
        mode-compile
        move-text
        multi-term
        multiple-cursors
        paredit
        rspec-mode
        ruby-compilation
        ruby-electric
        ruby-mode
        ruby-test-mode
        rust-mode
        rvm
        sass-mode
        simp
        slime
        smex
        vlf
        wgrep
        yaml-mode
        yari
        yasnippet))
