;;; COMPILE_MODS.EM, J. Wilcoxson
;;;
;;; Compiles all modified buffers, stops on error
;;;

(defun cm ()
   (do_forever
       (select_mod_buf)
       (if (= (buffer_info name) ".buffers")
           (stop_doing))
       (compile)
       (if (^= 0 lm_num_errs$)
           (lm_next_error$)
           (stop_doing))
   )
)
