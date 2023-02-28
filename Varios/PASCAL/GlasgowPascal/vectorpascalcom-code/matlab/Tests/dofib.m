function fib =dofib(n);
fib = ones (1, n);
     i = 2;
     do
       i++;
       fib (i) = fib (i-1) + fib (i-2);
     until (i == n)
end;
