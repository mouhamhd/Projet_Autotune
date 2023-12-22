function out = generate_wave(w, Ts, duration)

    nT = 0:Ts:duration;
    out = zeros(1, length(nT));
    for i = 1 :length(nT)
        x(i) = multiplier(nT(i), w);
        if( (x(i) >= -8192) && (x(i) <= 8192))
            x(i) = lshift(x(i), 2);
            out(i) = sinfpv2(x(i));
        else
            x(i) =  add_int16_int16(mod(x(i),  16384), -8192);
            x(i) = lshift(x(i), 2);
            out(i) = sinfpv2(x(i));
        end
    end

end