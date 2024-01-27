 % ##########################
% Projet PTS
% 
% Auteurs : KAFNDO Boenzemwendé Israel & YATE Mouhammeth
% 
% Enseignant : Robin GERZAGUET



function prod = fixSine(x)

a = 25718; 
b = -20953;
c =  18276; 

%Intermediate values
x_square = multiplier(x, x); 
x_square = lshift(x_square, 1);
x_cube   = multiplier(x_square, x);
x_cube   = lshift(x_cube, 1);
x_pow_5  = multiplier(x_square, x_cube);
x_pow_5  = lshift(x_pow_5, 1);

% multiplication of a with x
a_x_init = multiplier(x, a);
a_x = lshift(a_x_init, 1);


%multiplication of x_3 with b
b_x_cube = multiplier(x_cube, b);


%multiplication of x_5 with c
c_x_5 =  multiplier(x_pow_5, c);
c_x_5 = rshift(c_x_5, 3);


%Adding  
temp = add_int16_int16(b_x_cube, c_x_5);
prod_temp  = add_int16_int16(temp, a_x);
prod = lshift(prod_temp, 1);


end