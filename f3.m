function [res] = f3(z)
%F3 Disequazione s della carta WI
%   K_l/B_3 = f_2(z) >= 1/(e_1 B_3^0)
res = exp(-pi*z./sqrt(1-z.^2));
end

