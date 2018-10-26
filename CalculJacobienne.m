function [jacob] = CalculJacobienne(params)
    % Calcule la jacobienne du bras articulé dans une configuration articulaire donnée

    % Inputs:
    %   params: structure des paramètres. Champs attendus : alpha, d, theta, r; tableaux de longueur N_articulations
    % Outputs:
    %   jacob : matrice jacobienne de dimension 6 x N_articulations.

    N_articulations = 6;
    N_reperes = size(params.alpha, 2);
    assert(N_reperes==7, 'There should be 6 moving frames and 1 still - 7 in total');
    % type_liaison(i) donne le type de lien de R(i) avec R(i-1): 
    %       - 0 pas de liaison
    %       - 1 liaison rotoïde
    %       - 2 prismatique
    type_liaison = [1 1 1 1 1 1 0];

    i_actionneur = 0;
    jacob = zeros(6, N_articulations);
    [t_final, ~, t_intermediaires] = CalculMGD(params);
    p_0E = t_final(1:3,4);

    for i_rep = 1:N_reperes
        if type_liaison(i_rep) == 1
            i_actionneur = i_actionneur + 1;
            oJi = ComposanteRotoide(i_rep, t_intermediaires, p_0E);
            jacob(:,i_actionneur) = oJi;
        % elseif type_liaison(i_rep) == 2
            % disp('prismatic not supported')
        % else
            % fprintf('Fixed frame %d- no column in jacobian \n', i_rep)
        end
    end
end

function [oJi] = ComposanteRotoide(i_repere, trans_intermediaires, p_0E)
    % Calcule la composante oJi dans la jacobienne d'une articulation rotoide
    % Inputs:
    %   i_repere : index du repere
    %   trans_intermediaires : liste des matrices de transformations intermédiaires (produit de la fonction CalculMGD)
    %   p_0E : coordonnées de l'effecteur dans R0
    % Outputs:
    %   oJi : composante 6x1 de la jacobienne pour l'articulation donnée 

    Z_i = [0; 0; 1];
    % confer definition of CalculMGD
    trans_0_i = trans_intermediaires(:,:,i_repere+1);
    p_0i = trans_0_i(1:3,4);
    p_iE = p_0E - p_0i;
    R_0i = trans_0_i(1:3,1:3);
    oJi = [ cross(R_0i * Z_i, p_iE) ; R_0i * Z_i];
end
