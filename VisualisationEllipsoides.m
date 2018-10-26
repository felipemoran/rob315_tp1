function [manipulabilite, S, U] = VisualisationEllipsoides(Q)
    % affichage graphique du bras articulé et de l'ellipsoide de manipulation
    % Inputs:
    %   Q : paramètres articulaires
    % Outputs:
    %   manipulabilité : volume de l'ellipsoide de manipulabilité de l'extremité du bras articulé
    %   S : matrice diagonale 3x3 des valeurs propres de la jacobienne des vitesse linéaires
    %   U : matrice orthogonale 3x3 des vecteurs propre de la jacobienne des vitesses linéaires
    params = ParamsFromQ(Q);
    J = CalculJacobienne(params);
    t_0E = CalculMGD(params);
    % position de l'extrémité du bras
    p_0E = t_0E(1:3,4);
    % Sous matrices des coordonnées linéaires de la jacobienne
    Jv = J(1:3, :);

    clf;
    VisualisationBras(Q);
    hold on;

    [U, S, ~] = svd(Jv);
    manipulabilite = sqrt(det(Jv*Jv.'));
    
    [x, y, z] = Ellipse3d(p_0E(1), p_0E(2), p_0E(3), S(1, 1), S(2, 2), S(3, 3), U);
    surf(x, y, z, 'FaceAlpha', 0.4, 'LineStyle', ':');
    hold off;
end
