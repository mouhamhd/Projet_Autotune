function tmp = add_int16_int16(a,b)
    % Bounds for the given type 
    vMax = lshift(1,15)-1;
    vMin = -lshift(1,15);
    % Pure sum, not typed 
    tmp = a + b ;
    % Check values 
    if tmp > vMax 
        tmp = vMin + (tmp - vMax);
    elseif tmp < vMin 
        tmp = vMax - (-tmp + vMin); 
    end
    tmp = double(tmp);
end