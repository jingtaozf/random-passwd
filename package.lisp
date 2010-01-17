;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*-
(in-package :common-lisp-user)

(defpackage :random-password 
  (:nicknames "password")
  (:use :cl :arnesi :CAPI)
  (:documentation "gui client for random password"))
