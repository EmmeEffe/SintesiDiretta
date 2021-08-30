function [res] = f2(z)
%F2 Disequazione K_l/B_3 della carta WI
%   K_l/B_3 = f_2(z) >= 1/(e_1 B_3^0)
res = 1./(2*z.*f4(z));
end

