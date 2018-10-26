function [jacob] = CalculJacobienne(params)
    %GCALCULJACOBIENNE Summary of this function goes here
    % Tous les 4 premiers arguments sont des tableaux de dimension N_reperes
    % type_liaison(i) donne le type de lien de R(i) avec R(i-1): 
    %       - 0 pas de liaison
    %       - 1 liaison rotoïde
    %       - 2 prismatique
    % 
    N_actionneurs = 6;
    type_liaison = [1 1 1 1 1 1 0];
    N_reperes = size(params.alpha, 2);
    assert(N_reperes==7, 'There should be 6 moving frames and 1 still - 7 in total');

    i_actionneur = 0;
    jacob = zeros(6, N_actionneurs);
    [t_final, ~, t_intermediaires] = CalculMGD(params);
    p_0E = t_final(1:3,4);

    % disp(t_intermediaires);

    for i_rep = 1:N_reperes
        if type_liaison(i_rep) == 1
            i_actionneur = i_actionneur + 1;
            oJi = ComposanteRotoide(i_rep, t_intermediaires, p_0E);
            jacob(:,i_actionneur) = oJi;
        elseif type_liaison(i_rep) == 2
            % disp('prismatic not supported')
        else
            % fprintf('Fixed frame %d- no column in jacobian \n', i_rep)
        end
    end
end

function [oJi] = ComposanteRotoide(i_repere, trans_intermediaires, p_0E)
    % fprintf('computing oJi for frame %d\n', i_repere);

    Z_i = [0; 0; 1];

    % confer definition of CalculMGD
    trans_0_i = trans_intermediaires(:,:,i_repere+1);
    % fprintf('Transform from 0 to frame %d\n', i_repere);
    % disp(trans_0_i);

    p_0i = trans_0_i(1:3,4);
    p_iE = p_0E - p_0i;
    % p_iE = trans_i_E(1:3,4)
    R_0i = trans_0_i(1:3,1:3);
    oJi = [ cross(R_0i * Z_i, p_iE) ; R_0i * Z_i];

end
