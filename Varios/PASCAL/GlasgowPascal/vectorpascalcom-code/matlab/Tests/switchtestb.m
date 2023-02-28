 function s=switchtestb(X)
   switch (X)
       case 1
         s=10;
       case 2
         s=20;
       otherwise
         s=X;
     endswitch
      A = 7;
     switch A
       case { 6, 7 }
         printf ("variable is either 6 or 7\n");
       otherwise
         printf ("variable is neither 6 nor 7\n");
     endswitch
     end