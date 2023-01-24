% Perform bitwise right shift of input a on k bits 
% Equivalent to a>>k 
function out = rshift(a,k) 
out = a / 2^k;
end