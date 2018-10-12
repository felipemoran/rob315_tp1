function something = MGI(something_else)

% ....


alpha = [0   pi/2 0   pi/2 -pi/2 pi/2];
d =     [0   0    0.7 0    0     0   ];
r =     [0.5 0    0   0.2  0     0   ];
Offset = [0 0 pi/2 0 0 0];


while CONTINUE
    
    J = CalculJacobienne(alpha, d, q(:,k), r);
    Jv = J(1:3,:);
    [g_06, g_elem] = CalculMGD(alpha, d, q(:,k) + Offset, r);
    rE = 0.1;
    g_6E = CalculTransformationElem(0, 0, 0, rE);
    g_0E = g_06 * g_6E;
    X(:,k) = g_0E(1:3,4);
    
    dX = Xd - X(:,k);
    
    q(:,k+1) = q(:,k) + pinv(Jv) * dX;
    
    if ( norm(Dx - X(:,k), 2) < Epsiln_x)
        CONTINUE = false;
    elseif k > max
        CONTINUE = false;
    end
    
    k = k+1
    
end