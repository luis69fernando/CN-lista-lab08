clear; clc;

function f = diff1(t, y)
    //E(t) = 12V; L = 0.5H; R = 10ohm; di(t)/dt = (E(t) - R*i(t))/L
    f = (12 - 10*y)/0.5;//y' = f(x, y);
endfunction

function E = Euler(y0, t0, t, h, f)
    n = length(t), E = y0;
    for i=1:n-1
        y0 = y0 + h*f(t(i), y0);
        E = [E y0];
    end
endfunction

//Informações iniciais : 

y0 = 0; t0 = 0; h=0.01; t = t0:h:1;

//Resolução pelo metodo de Euler : 

y = Euler(y0, t0, t, h, diff1);

//Resolução analítica : 

y1 = ode(y0, t0, t, diff1);

//Plot dos gráficos : 
xgrid
plot(t, y, 'o')
plot(t, y1, '-r')
//obs: entre t = 0.2 e 0.3 a bateria fica totalmente carregada e se a corrente i(t) se mantem constante
