%sintesi diretta del controllore tramite la carta WI
e1 = input("Inserisci il valore dell'errore a regime di inseguimento di una rampa unitaria in ingresso al sistema: -> ");
s = input("Inserisci il valore della massima sovraelongazione del sistema: -> ");
B3 = input("Inserisci il valore della Banda del sistema: -> ");

lim3 = inverse3(s);
lim2 = inverse2(e1, B3);
if(length(lim2)==1)
    if(lim3>lim2)
        error("Non è possibile trovare il controllore");
    else
        z = input("Inserisci un valore di z compreso tra "+ lim3 +" e "+lim2+": -> ");
        while((z<lim3)||(z>lim2))
            z = input("Inserisci un valore di z compreso tra "+ lim3 +" e "+lim2+": -> ");
        end
    end
else %se ho 2 estremi dalla funzione 2
    if(lim3>lim2(1))%se conta solo l'estremo dx di lim2
        z = input("Inserisci un valore di z compreso tra "+ max(lim2(2),lim3) +" e 1: -> ");
        while((z<max(lim2(2),lim3))||(z>1))
            z = input("Inserisci un valore di z compreso tra "+ max(lim2(2),lim3) +" e 1: -> ");
        end
    else
        z = input("Inserisci un valore di z compreso tra "+ lim3 +" e "+lim2(1)+" oppure tra "+lim2(2)+" e 1: -> ");
        while(~(((z<=lim2(1))&&(z>=lim3))||((z>=lim2(2))&&(z<=1))))
            z = input("Inserisci un valore di z compreso tra "+ lim3 +" e "+lim2(1)+" oppure tra "+lim2(2)+" e 1: -> ");
        end
    end
end
wn = findwn(z, B3);
disp("");
disp("");
disp("--- RISULTATI ---");
disp("Il valore di Omega n richiesto è pari a "+wn);

s = tf([1 0], [1]);
W = 1/(1+2*z*s/wn+(s/wn)^2)
L = W/(1-W)

figure;
step(W), grid
title("Risposta al Gradino");
figure;
step(1/(s*(1+L))), grid
title("Errore di risposta alla rampa")