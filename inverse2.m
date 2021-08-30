function [z] = inverse2(e1, B3)
%INVERSE2 Trova il valore di z max dati l'errore a regime e la banda
%passante
z=0;
step = 0.01;
threshold = 1/(e1*B3);
if(threshold>f2(1)) %ho una sola soluzione
    while(f2(z)>=threshold)
        z=z+step;
    end
    z = z-step;
else %ho due soluzioni
    i=0;
    while(f2(i)>=threshold)
        i=i+step;
    end
    z(1) = i-step;
    while(f2(i)<threshold)
        i=i+step;
    end
    z(2) = i;
end



