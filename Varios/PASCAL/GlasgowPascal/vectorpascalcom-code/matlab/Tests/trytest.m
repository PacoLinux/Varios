function s=trytest(a,b)
    try
       s=a(1)
       s=a(:)
     catch
       s=0
     end_try_catch

end
 