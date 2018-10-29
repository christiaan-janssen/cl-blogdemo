;;;; templates.lisp

(in-package #:blogdemo)

(<:augment-with-doctype "html" "" :auto-emit-p t)

(defun html-frame (context)
  (<:html
   (<:head (<:title (getf context :title)))
   (<:body
    (<:div
     (<:h1 (getf context :title))
     (<:a :href (genurl 'home) "Home") " | "
     (if (hunchentoot:session-value :username)
         (list
          (<:a :href (genurl 'add) "Add a blog post") " | "
          (<:a :href (genurl 'logout)
               (format nil "Logout ~A"
                       (hunchentoot:session-value :username)))))
     (<:hr))
    (getf context :body))))
