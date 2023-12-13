% Perform bitwise left shift of input a on k bits 
% Equivalent to a<<k 
function out = lshift(a,k) 
out = double(int16(a) * 2^k);
end