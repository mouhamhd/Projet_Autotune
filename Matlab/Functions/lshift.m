% Perform bitwise left shift of input a on k bits 
% Equivalent to a<<k 
function out = lshift(a,k) 
out = int16(double((a) * 2^k));
end