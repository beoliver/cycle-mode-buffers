# cycle-mode-buffers
#### Bind keys to cycle though buffers that belong to a particular major mode.

Have you ever wanted to be able to selectively cycle through your buffers quickly? Ever wanted to be able to cycle through all of your open `.myFavouriteLanguage` files, **ignoring** everything else?

Just put this file somewhere in your .emacs.d directory and add `(require 'cycle-mode-buffers)` to your init.el file. 
You must provide the quoted *major mode hook* **not** quoted *major mode*. If you are unsure which major mode you need, open a file and type `M: major-mode`. Just stick a `-hook` on the end and you should be fine! 
The keybindings must be the internal emacs representations, this means that you might wite something like:

```
(add-buffer-cycling-to-mode 'python-mode-hook (kbd 'C-,') (kbd 'C-.'))
(add-buffer-cycling-to-mode 'clojure-mode-hook (kbd 'C-,') (kbd 'C-.'))
(add-buffer-cycling-to-mode 'scheme-mode-hook [f8] [f9])
```

Now, if you have say 5 *python* files and 10 *clojure* files open, whenever you have a *python* file in your buffer, `C-.` will replace it with the next *python* file you have open. If you move to a *clojure* file, `C-.` will do the same, but only for *clojure* files. If you had any *scheme* files open, the keys `C-.` and `C-,` would be undefined.


