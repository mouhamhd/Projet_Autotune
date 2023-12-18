 % ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET



function prod = fixSine(x)

a_init = 12/pi - 9/4;
b_init = -2*a_init  + 5/2;
c_init = a_init - 3/2;

x = round(lshift(x, 15));
a = round(lshift(a_init, 14));
b = round(lshift(b_init, 15));
c = round(lshift(c_init, 19));

x_square = multiplier(x, x); 
x_square = round(lshift(x_square, 1));
x_cube   = multiplier(x_square, x);
x_cube   = round(lshift(x_cube, 1))
x_pow_5  = multiplier(x_square, x_cube);
x_pow_5  = round(lshift(x_pow_5, 1));

% multiplication of a with x
a_x_init = multiplier(x, a);
%a_x = round(lshift(a_x_init, 1));

%multiplication of x_square with b
b_x_square = multiplier(x_square, b);
%b_x_square = rshift(b_x_square, 1);


%multiplication of x_cube with c
c_x_cube =  multiplier(x_cube, b);
c_x_cube = round(rshift(c_x_cube, 4));

%Adding  
temp = add_int16_int16(b_x_square, c_x_cube);
temp = round(rshift(temp, 1));
prod = add_int16_int16(temp, a_x_init);
prod = round(lshift(prod, 1));

plot(prod);

end