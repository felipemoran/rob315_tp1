function [transform] = CalculTransformationElem(alpha, d, theta, r)
    % Calcule la matrice 4x4 de transformation des coordonnées du solide B vers son parent A.
    % Les paramètres d'entrées sont compris dans la convention de Khalil-Kleinfinger
    % Input:
    %   alpha
    %   d
    %   theta
    %   r     : paramétrisation de Khalil-Kleinfinger du corps B par rapport à A
    % Outputs:
    %   transform : matrice de transformation homogène. Pour un point p, on a:
    %       > p_a = transform * p_b

    transform = [cos(theta), -sin(theta), 0, d; ...
                     cos(alpha) * sin(theta), cos(alpha) * cos(theta), -sin(alpha), -r * sin(alpha); ...
                     sin(alpha) * sin(theta), sin(alpha) * cos(theta), cos(alpha), r * cos(alpha); ...
                     0, 0, 0, 1];
end
