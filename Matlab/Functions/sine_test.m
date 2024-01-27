function out = sine_test(N)

%     if (x >= -16384 && x <= 16384)
%         x = lshift(x, 1);
%         out = sinfpv2(x);
%         else
%         if (x > 0)
%             y = mod(x, 16384) - 16384;
%             y = lshift(y, 1);
%             out = sinfpv2(y); 
%         else
%             
%             y = mod(x, 16384);
%             y = lshift(y, 1);
%             out = sinfpv2(y); 
%         end
%          
%     end

w = 30;
phi = 0;


for i = 1:N
  if(phi <  0) 
      
      phi = 0;
    else
      out = sinfpv2(phi);
      phi = add_int16_int16(phi, w)   
  end 
end
end