function [ final_trans ] = CalculMGD( alpha, dist, theta, ray )
%CALCULMGD Summary of this function goes here
%   Detailed explanation goes here
n_reperes = size(alpha);
trans = eye(4);
for rep = 1:n_reperes(2)
    trans = trans * CalculTransformationElem(alpha(rep), dist(rep), theta(rep), ray(rep));
    disp(trans)
end
final_trans = trans;
end

