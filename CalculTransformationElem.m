function [ transform ] = CalculTransformationElem( alpha, dist, theta, ray)
%CALCULTRANSFORMATIONELEM matrice de transformation homogène entre 2
%repères
%   alpha ,dist, theta, ray selon les conventions de Khalil-Kleinfinger
transform = [cos(theta)            -sin(theta)             0           dist;...
             cos(alpha)*sin(theta)  cos(alpha)*cos(theta)   -sin(alpha) -ray*sin(alpha);...
             sin(alpha)*sin(theta)  sin(alpha)*cos(theta)   cos(alpha)  ray*cos(alpha);...
             0                      0                       0           1];
end

