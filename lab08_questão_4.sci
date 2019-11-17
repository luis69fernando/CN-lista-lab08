clear; clc;
function xdot = fsis(t, x)
    L = 0.001, C = 0.000001; 
    R = 10;
    Et = 1;
    //w = %pi/6, Et = 2*sin(w*t);
    xdot(1) = x(2);
    xdot(2) = (Et -R*C*x(2) - x(1))/(L*C);
endfunction
function x= euler_sis(x0, t0, t, f)
    n = length(t) , x = x0;
    for j = 1 : n-1
        x0 = x0 + (t(j+1) - t(j)) * f(t(j), x0);
        x = [x x0] ;
    end
endfunction
//Condições iniciais :

x0 = [0, 0]' ; t0 = 0; t = 0:0.00001:0.001; t = t';

//Solução pelo metodo de Euler : 

y = euler_sis(x0, t0, t, fsis);

//Solução analítica : 

y1 = ode(x0, t0, t, fsis);

//Gráficos : 

clf();
plot(t, y')
xset('window', 1)
plot(y1(2,:), y1(1,:), 'g')
plot(y(2,:), y(1,:), 'r')
