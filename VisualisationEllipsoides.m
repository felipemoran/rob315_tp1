function [] = VisualisationEllipsoide(Q)
    params = ParamsFromQ(Q)
    J = gCalculJacobienne(params{:})
    t_0E = CalculMGD(params{:})
    p_0E = t_0E(1:3,4)
    Jv = J(1:3, :)

    clf;
    VisualisationBras(Q);
    hold on;

    [U, S, V] = svd(Jv)
    % Vpropres_vitesse = U(1:3,1:3)
    % disp(Vpropres_vitesse*Vpropres_vitesse.')
    [x, y, z] = Ellipse3d(p_0E(1), p_0E(2), p_0E(3), S(1, 1), S(2, 2), S(3, 3), U);
    surf(x, y, z)
    hold off;
end
