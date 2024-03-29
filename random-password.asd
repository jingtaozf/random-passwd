;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;; Xu Jingtao <jingtaozf@gmail.com>

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package :jingtao.system)
    (defpackage :jingtao.system
      (:use :cl :asdf))))
(in-package :jingtao.system)

(asdf:defsystem random-password
  :author "Xu Jingtao <jingtaozf@gmail.com>"
  :version "0.1"
  :serial t
  :description "gui interface for random password"
  :components ((:module package :pathname "./"
						:components ((:file "package")))
               (:module user :pathname "./"
                        :components ((:file "main")) :serial t))
  :properties ((version "0.1"))
  :depends-on (:arnesi :split-sequence))
