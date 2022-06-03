% Evaluate the string str received from the Zybo device and convert it into
% the appropriate format
% It assumes that the function print_array_u32 has been used on the Zybo
% side

function resCasted = loadArray_u32(cell,index)
    % --- Get only what we want
    subStr = cell{index};
    % --- Find the dynamix name 
    id = strfind(subStr,'=');
    theName = extractBetween(subStr,1,id-2);
    % --- Load in function scope 
    eval(subStr)
    % --- We have res loaded as float.
    % Time to type it accordingly to what we have done on Zybo side. In
    % Matlab this is hell as everything is untyped, but the following should
    % to the trick => We force uint32 (from print_array) and then recast it
    % into signed mode. We should also do this in metaprogramming mode to
    % be sure we initiate an array as output parameter of the function and
    % be adapted to the name of the parameter set on Zybo side.
    theCommand = ['resCasted = u32_to_float(' char(theName) ');'];
    eval(theCommand) % Here we have resCasted in local scope
end

% Cast the array as a int16 from a u32.
function res = u32_to_float(arr)
 res = typecast( uint32(arr),'int32');
end