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

%x = lshift(x, 15); To be done outside the function
a = lshift(a_init, 14);
b = lshift(b_init, 15);
c = lshift(c_init, 18);

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
%temp = b_x_cube + c_x_5;
temp = add_int16_int16(b_x_cube, c_x_5);
%prod_temp = temp + a_x;
prod_temp  = add_int16_int16(temp, a_x);
prod = lshift(prod_temp, 1);
%prod = prod_temp;





end