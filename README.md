# ivy-xref - select from xref candidates with ivy

[![License GPL 3](https://img.shields.io/badge/license-GPL_3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.txt)
[![MELPA](http://melpa.org/packages/ivy-xref-badge.svg)](http://melpa.org/#/ivy-xref)
[![Build Status](https://travis-ci.org/alexmurray/ivy-xref.svg?branch=master)](https://travis-ci.org/alexmurray/ivy-xref)

Use [Ivy](https://github.com/abo-abo/swiper) as the interface to select from
xref candidates.

![](https://raw.githubusercontent.com/alexmurray/ivy-xref/master/ivy-xref.png)

## Installation

### MELPA

The preferred way to install `ivy-xref` is via
[MELPA](http://melpa.org) - then you can just <kbd>M-x package-install RET
ivy-xref RET</kbd>

To enable then simply add the following to your init file:

```emacs-lisp
(require 'ivy-xref)
;; xref initialization is different in Emacs 27 - there are two different
;; variables which can be set rather than just one
(when (>= emacs-major-version 27)
  (setq xref-show-definitions-function #'ivy-xref-show-defs))
;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
;; commands other than xref-find-definitions (e.g. project-find-regexp)
;; as well
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
```

We recommend to use [use-package](https://github.com/jwiegley/use-package) to
make this automatic:

```emacs-lisp
(use-package ivy-xref
  :ensure t
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))
```

### Manual installation

If you would like to install the package manually, download or clone it and
place within Emacs' `load-path`, then enable as above.

## License

Copyright © 2017 Alex Murray

Distributed under GNU GPL, version 3.
