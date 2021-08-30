function [res] = f4(z)
%Funzione f4 della carta WI
res = sqrt(1-2*z.^2+sqrt(2-4*z.^2+4*z.^4));
end

