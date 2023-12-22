

function out = sinfpv2(x)
    %Function return a sin value of a number x betwen -pi and pi

   if (x < 16384 && x > - 16384) % x is betwen -pi/2 and pi/2
       x = lshift(x, 1);
     out = fixSine(x);
     elseif(x >= 16384 && x < 32768) % x is betwen pi/2 and pi 
      x_temp = add_int16_int16(32768, -x);
      x_temp = lshift(x_temp, 1);
      out = fixSine(x_temp);
   else
      x_temp = add_int16_int16(-32768, -x);
      x_temp = lshift(x_temp, 1);
      out = fixSine(x_temp);  %x is betwen -pi and -pi/2 
   end

 end

