function [final_trans, element_transforms, intermediate_transforms] = CalculMGD(params)
    % Calcule le modèle géométrique direct du bras pour une configuration articulaire
    % Inputs:
    %   params : structure des paramètres. Champs attendus : alpha, d, theta, r; tableaux de longueur N_articulations
    % Outputs:
    %   final_trans : matrice 4x4 de transformation du repère final par rapport à R0
    %   element_transforms : liste de matrices 4x4 x N_reperes donnant les matrices elementaires de transformation.
    %       element_transforms(:,:,i) donne la transformation de R(i-1) vers R(i)
    %   intermediate_transforms : liste de matrices 4x4 x (N_reperes+1). 
    %       intermediate_transforms(:,:,i) donne la matrice de transformation de R0 vers R(i-1)
    %       > intermediate_transforms(:,:,1) = eye(4)
    %       > intermediate_transforms(:,:,N_reperes+1) = final_trans

    n_reperes = size(params.alpha, 2);
    trans = eye(4);
    intermediate_transforms = zeros(4, 4, n_reperes + 1);
    intermediate_transforms(:, :, 1) = eye(4);
    element_transforms = zeros(4, 4, n_reperes);

    for rep = 1:n_reperes
        elt_trans = CalculTransformationElem(params.alpha(rep), params.d(rep), params.theta(rep), params.r(rep));
        element_transforms(:, :, rep) = elt_trans;
        trans = trans * elt_trans;
        intermediate_transforms(:, :, rep+1) = trans;
    end
    final_trans = trans;
end
