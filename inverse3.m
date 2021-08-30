function [z] = inverse3(s)
%INVERSE2 Trova il valore di z min data la sovraelongazione massima
%passante
z=0;
step = 0.01;
while(f3(z)>s)
    z = z+step;
end
end