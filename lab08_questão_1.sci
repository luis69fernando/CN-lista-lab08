clear; clc;

function f = diff1(t, y)
    f = log(3/2)*y;//y' = f(x, y);
endfunction

function E = Euler(y0, t0, t, h, f)
    n = length(t), E = y0;
    for i=1:n-1
        y0 = y0 + h*f(t(i), y0);
        E = [E y0];
    end
endfunction

//Informações iniciais : 

y0 = 1000; t0 = 0; h=0.1; t = t0:h:5;

//Resolução pelo metodo de Euler : 

y = Euler(y0, t0, t, h, diff1);

//Resolução analítica : 

y1 = ode(y0, t0, t, diff1);

//Plot dos gráficos : 
xgrid
plot(t, y, 'o')
plot(t, y1, '-r')
//obs: pelo gráfico 3000 esta entre t = 2.5 e t = 3. Pelo calculo esta em ln(3)/ln(3/2) = 2.7095.
