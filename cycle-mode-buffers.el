;; cycle-mode-buffers.el
;; Author: Ben Oliver
;; https://github.com/beoliver
;; Feb, 2017
;;
;; Just put this file somewhere in your .emacs.d folder
;;
;; add (require 'cycle-mode-buffers) to init.el
;; you must provide the major mode hook NOT the major mode
;; the keybindings must be the internal emacs representations
;; (add-buffer-cycling-to-mode 'python-mode-hook (kbd 'C-,') (kbd 'C-.'))
;;
;; Now, if you have a .py file open in your current buffer,
;; you can cycle through ALL open .py files
;; You can bind multiple modes to the same keys

(setq *cycle-mode-buffers/current-mode* nil)

(defun set-movement-keybindings-for-mode (kbd-previous kbd-next)
  "use keybindings to cycle buffers that belong to the major mode"
  (progn
    (local-set-key kbd-next (lambda ()
			      (interactive)
			      (setq *cycle-mode-buffers/current-mode* major-mode)
			      (next-buffer)
			      (while (not (equal major-mode *cycle-mode-buffers/current-mode*))
				(next-buffer))))
    (local-set-key kbd-previous (lambda ()
				  (interactive)
				  (setq *cycle-mode-buffers/current-mode* major-mode)
				  (previous-buffer)
				    (while (not (equal major-mode *cycle-mode-buffers/current-mode*))
				      (previous-buffer))))))

(defmacro add-buffer-cycling-to-mode (mode-hook previous-kbd next-kbd)
  "provides backwards and forwards cycling, through all buffers that
have mode as their major-mode.
(add-buffer-cycling-to-mode 'python-mode-hook (kbd 'C-,') (kbd 'C-.'))
(add-buffer-cycling-to-mode 'clojure-mode-hook (kbd 'C-,') (kbd 'C-.'))
(add-buffer-cycling-to-mode 'scheme-mode-hook [f11] [f12])'"
  `(add-hook ,mode-hook (lambda () (set-movement-keybindings-for-mode ,previous-kbd ,next-kbd))))

(provide 'cycle-mode-buffers)
