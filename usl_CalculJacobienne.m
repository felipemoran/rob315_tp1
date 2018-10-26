function J = CalculJacobienne(alpha, d, theta, r)

z_i = [0; 0; 1];
N = length(theta);
J = zeros(6,N);
Offset = [0 0 pi/2 0 0 0];
[g_06, g_elem] = CalculMGD(alpha, d, theta + Offset, r);
rE = 0.1;
g_6E = CalculTransformationElem(0, 0, 0, rE);
g_0E = g_06 * g_6E;

for i=1:N
%     p_iE = zeros(3,1);
    
    p_0E = g_0E(1:3,4);
    g_0i = eye(4);
    for j=1:i
        g_0i = g_0i * g_elem(:, :, j);
    end
    p_0i = g_0i(1:3,4);
    p_iE = p_0E - p_0i;
    
    R_0i = g_0i(1:3, 1:3);
%     fprintf("i: %d", i);
    oJi = [ cross(R_0i * z_i, p_iE); R_0i * z_i ];
    
    J(1:6,i) = oJi;

end
end