function [ final_trans , intermediate_trans] = CalculMGD( alpha, dist, theta, ray )
%CALCULMGD Computes final and intermediate transformation matrices
%   iteratively applies transformations from CalculTransformationElem
%   NOTE: final_trans = intermediate_trans(n_reperes, :, :)
n_reperes = size(alpha);
trans = eye(4);
intermediate_trans = zeros(n_reperes, 4, 4);
for rep = 1:n_reperes(2)
    
    trans = trans * CalculTransformationElem(alpha(rep), dist(rep), theta(rep), ray(rep));
    intermediate_trans(rep, :,:) = trans;
    % disp(trans)
end
final_trans = trans;
end

