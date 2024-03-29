;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*-

(in-package "CL-USER")
(load-all-patches)
(defvar *delivered-image-name* "./cl-random-password.exe")

(defvar *deliverd-env* t);;a var indicates this is a delived environment.
;;; Load the application code.
(asdf-load 'random-password)

;;; Deliver the application
(deliver 'random-password::win-main *delivered-image-name* 5
         :keep-lisp-reader t
         :kill-dspec-table nil
         :console :input ;for debug only.
         :interface :capi
         :icon-file "favicon.ico")
