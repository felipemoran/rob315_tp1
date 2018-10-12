function [g_final, g_elem] = CalculMGD(alpha, d, theta, r)

g_final = eye(4);
n = length(alpha);
g_elem = zeros(4, 4, n);

for i = 1:n
    g_elem(:,:,i) = CalculTransformationElem(alpha(i), d(i), theta(i), r(i));
    
    g_final = g_final * g_elem(:,:,i);
    
end

end