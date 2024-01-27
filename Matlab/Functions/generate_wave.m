function out = generate_wave(Fc, Fs, n)

    %Fc => Q(16,15, 0); 
    fc_temp = lshift(Fc, 1); 
    omega = multiplier(fc_temp,  lshift(4, 12));
    
    out = [];
    phi = [];
    
    out(1) = 0; % sin(0) = 0
    phi(1) = 0; % Sans déphasage on part de zero
    
    
    for k = 2:n
        % L'additionneur sur 16 bits permet d'avoir la periodicité de 4
        % grace à l'overflow
        phi(k) = add_int16_int16(phi(k-1), omega); 
        out(k) = sinfpv2(phi(k));
    end

end