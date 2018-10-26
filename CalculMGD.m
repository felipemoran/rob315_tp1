function [final_trans, element_transforms, intermediate_transforms] = CalculMGD(params)
    %CALCULMGD Computes final and intermediate transformation matrices
    %   iteratively applies transformations from CalculTransformationElem
    %   NOTE: final_trans = intermediate_transforms(:, :, n_reperes+1)
    %           because intermediate_transforms(:, :,1) = Id ( = repere R0 )
    %   NOTE: generally speaking, intermediate_transforms(:, :, i+1) is the transform from 0 to body i
    % element_transforms(:,:,i) is the transformation matrix between the bodies i-1 and i
    n_reperes = size(params.alpha, 2);
    % disp(n_reperes);
    trans = eye(4);
    intermediate_transforms = zeros(4, 4, n_reperes + 1);
    intermediate_transforms(:, :, 1) = eye(4);
    element_transforms = zeros(4, 4, n_reperes);

    for rep = 1:n_reperes
        elt_trans = CalculTransformationElem(params.alpha(rep), params.dist(rep), params.theta(rep), params.radius(rep));
        element_transforms(:, :, rep) = elt_trans;
        trans = trans * elt_trans;
        intermediate_transforms(:, :, rep+1) = trans;
        % disp(trans)
    end

    final_trans = trans;
end
