(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'railscasts t nil)
(menu-bar-mode  -1)                       ;; turn-off the menu
(tool-bar-mode -1)                       ;; turn-off toolbar 

;; date 31may15
;; find file
(defun find-file-at-point-with-line()
  "if file has an attached line num goto that line, ie boom.rb:12"
  (interactive)
  (setq line-num 0)
  (save-excursion
    (search-forward-regexp "[^ ]:" (point-max) t)
    (if (looking-at "[0-9]+")
         (setq line-num (string-to-number (buffer-substring (match-beginning 0) (match-end 0))))))
  (find-file-at-point)
  (if (not (equal line-num 0))
      (goto-line line-num)))

;; ------------
;; -- Macros --
;; ------------
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x\C-i" 'find-file-at-point-with-line)

(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(add-to-list 'load-path
              "~/.emacs.d/cobranet")

(require 'yasnippet)
(yas-global-mode 1)

(autoload 'typing-of-emacs "typing" "The Typing Of Emacs, a game." t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)


(set-face-attribute 'default nil :height 120)
(setq inhibit-startup-message t)
