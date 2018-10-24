function [final_trans, element_trans, intermediate_trans] = CalculMGD(alpha, dist, theta, ray)
    %CALCULMGD Computes final and intermediate transformation matrices
    %   iteratively applies transformations from CalculTransformationElem
    %   NOTE: final_trans = intermediate_trans(n_reperes+1, :, :)
    %           because intermediate_trans(1, :, :) = Id (repere R0 )
    % element_trans
    n_reperes = size(alpha);
    disp(n_reperes);
    trans = eye(4);
    intermediate_trans = zeros(n_reperes(2) + 1, 4, 4);
    intermediate_trans(1, :, :) = eye(4);
    element_trans = zeros(n_reperes(2), 4,4);

    for rep = 1:n_reperes(2)
        elt_trans = CalculTransformationElem(alpha(rep), dist(rep), theta(rep), ray(rep));
        element_trans(rep, :, :) = elt_trans;
        trans = trans * elt_trans;
        intermediate_trans(rep + 1, :, :) = trans;
        % disp(trans)
    end

    final_trans = trans;
end
