% Evaluate the string str received from the Zybo device and convert it into
% the appropriate format
% It assumes that the function print_array_u32 has been used on the Zybo
% side

function resCasted = loadArray_float(cell,index)
    % --- Get only what we want
    subStr = cell{index};
    % --- Find the dynamix name 
    id = strfind(subStr,'=');
    theName = extractBetween(subStr,1,id-2);
    % --- Load in function scope 
    eval(subStr)
    % --- We have res loaded as float.
    theCommand = ['resCasted = ' char(theName) ';'];
    eval(theCommand) % Here we have resCasted in local scope
end
