;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*-
(in-package :random-password)

(define-interface gui-main-pane ()
  ()
  (:panes
   (random-pass text-input-pane :title "随机密码" :visible-min-width '(:character 10))
   (func-buttons push-button-panel 
               :items '("生成随机密码(G)" "复制到剪贴版(C)")
               :selection-callback 'random-password-funcs
               :layout-class 'row-layout :layout-args '(:gap 10)))
  (:layouts
   (default-layout column-layout '(random-pass func-buttons) :default t))
  (:default-initargs :best-height 400 :message-area t :title "随机密码生成器"))

(defvar *random-chars* "01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defun random-password-funcs (data pane)
  (with-slots (random-pass) pane
     (cond ((string= data "生成随机密码(G)")
            (setf (text-input-pane-text random-pass) 
              (with-output-to-string (out)
                (loop for len = (length *random-chars*)
                      for i from 0 to 6
                      do (format out 
                                 "~A"
                                 (aref *random-chars* (random (length *random-chars*))))))))
       ((string= data "复制到剪贴版(C)")
        (set-clipboard pane (text-input-pane-text random-pass))))))

(defun gui-main ()
  (display (make-instance 'gui-main-pane)))

(export '(win-main)) ;export for deliver.
(defun win-main () 
  (gui-main))
