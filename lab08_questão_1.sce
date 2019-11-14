//y' = f(x, y) => y' = kP, onde k = 0.4054651
function f = diff1(t, x)
    //f = f(x, y)
    f = 0.4054651*t;
endfunction
function x = euler(x0, y0, t, h, f)
    n = length(t), x = x0;
    for j = 1 : n-1
        //y(xi +h) = y(xi) + h*f(xi, yi)
        x0 = x0 + h*f(t(j), x0) ;
        x = [x x0];
    end
endfunction
//Condiçoes iniciais :

x0 = 1; y0 = 1; h = 0.25; x =x0:h:5;

//Solução pelo metodo de Euler :

y = euler(x0, y0, x, h, diff1);

//Solução analítica :

y1 = ode(x0, y0, x, diff1);

//Graficos : 

plot(x, y, 'o')//Gráfico da solução numérica
plot(x, y1, '-r')//Gráfico da solução analítica
