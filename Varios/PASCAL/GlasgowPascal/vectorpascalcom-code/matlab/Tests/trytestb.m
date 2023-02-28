function s=trytestb(a,b)
    try
      
       s=a(:,b);
     catch
       s=0
     end_try_catch

end
 