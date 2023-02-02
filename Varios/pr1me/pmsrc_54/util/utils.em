;;;
;;;  STRING_REVERSE - reverse a character string
;;;
(defun string_reverse ((s string)
                       &returns string
                       &local (r string)
                              (i integer))
    (setq i (string_length s))
    (setq r "")
    (do_n_times i
        (setq r (catenate r (substr s i 1)))
        (setq i (1- i))
    )
    (return r)
)
;;;
;;;  BASENAME - returns basename of pathname argument
;;;
(defun basename ((path string)
                 &returns string
                 &local (temp string)
                        (base string)
                        (i integer))

    (setq temp (string_reverse (file_info path entry_name)))
    (setq i (index temp "."))
    (if (= 0 i)
        (return (file_info path entry_name))
    else
        (return (string_reverse (substr temp (1+ i))))
    )
)
;;;
;;;  SUFFIX - returns suffix of pathname argument
;;;
(defun suffix ((path string)
               &returns string
               &local (temp string)
                      (i integer))

    (setq temp (string_reverse (file_info path entry_name)))
    (setq i (index temp "."))
    (if (= 0 i)
        (return "")
    else
        (return (string_reverse (substr temp 1 (1- i))))
    )
)
