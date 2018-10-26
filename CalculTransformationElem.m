function [ transform ] = CalculTransformationElem( alpha, dist, theta, radius)
%CALCULTRANSFORMATIONELEM matrice de transformation homogène entre 2
%repères
%   alpha ,dist, theta, radius selon les conventions de Khalil-Kleinfinger
transform = [cos(theta)            -sin(theta)             0           dist;...
             cos(alpha)*sin(theta)  cos(alpha)*cos(theta)   -sin(alpha) -radius*sin(alpha);...
             sin(alpha)*sin(theta)  sin(alpha)*cos(theta)   cos(alpha)  radius*cos(alpha);...
             0                      0                       0           1];
end

