# cycle-mode-buffers
#### Bind keys to cycle though buffers that belong to a particular major mode.

Have you ever wanted to be able to selectively cycle through your buffers quickly? Lets say we wanted to be able to cycle through all open python files, ignoring everything else.

Just put this file somewhere in your .emacs.d directory and add `(require 'cycle-mode-buffers)` to your init.el file. To use, you might want to add something like this...

`(add-buffer-cycling-to-mode 'python-mode-hook (kbd 'C-,') (kbd 'C-.'))`
`(add-buffer-cycling-to-mode 'clojure-mode-hook (kbd 'C-,') (kbd 'C-.'))`

You must provide the quoted *major mode hook* **not** quoted *major mode*.
The keybindings must be the internal emacs representations, this means that you could wite something like:

`(add-buffer-cycling-to-mode 'python-mode-hook [f8] [f9])`

Now, if you have say 5 *python* files and 10 *clojure* files open, when ever you have a *python* file in your buffer, `C-.` will replace it with the next *python* file you have open. If you move to a *clojure* file, `C-.` will do the same, but only for *clojure* files.

Simple.
