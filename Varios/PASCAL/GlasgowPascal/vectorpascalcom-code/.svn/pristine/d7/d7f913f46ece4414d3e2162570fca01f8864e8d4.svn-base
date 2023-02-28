       .387
       .model tpascal
       ideal
       %pagesize 59
       Codeseg


       Proc Cos FAR X: qword
       Public Cos
       fld     [qword ptr x]
       fwait
       fcos
       ret
       endp


       Proc Sin FAR X: qword
       Public Sin
       fld     [qword ptr x]
       fwait
       fsin
       ret
       endp


       Proc Tan FAR X: qword   ; This function is not complete!
       Public Tan
       fld     [qword ptr x]
       fwait
       fsincos
       fdiv
       ret
       endp
       end


