 function out = sinfpv2(x)


   if (x < 2^15 & x > -2^15)
     out = fixSine(x);
     elseif(x >= 2^15 & x < 2*2^14)
      out = fixSine(2*2^14-x);
     else
      out = fixSine(-2*2^14-x);
   endif

 endfunction

