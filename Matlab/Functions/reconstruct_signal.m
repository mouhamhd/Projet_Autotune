function sig = reconstruct_signal(fe)
 Te = 1/fe;
 n1 = 0 : Te: 0.064; 
 n2 = 0:Te:0.448;
 n3 = 0.32:Te:3.008;
 n4 = 2.88:Te:4.032;
 n5 = 3.504:Te:4.915;
 
 f1 = 30;
 f2 = 350;
 f3 = 2500;
 f4 = 1200;
 f5 = 400;
 
 sig1 = sin(2*pi*f1*n1);
 sig2 = sin(2*pi*f2*n2);
 sig3 = sin(2*pi*f3*n3);
 sig4 = sin(2*pi*f4*n4);
 sig5 = sin(2*pi*f5*n5);
 sig = [sig1 sig3 sig3 sig4 sig5];
end