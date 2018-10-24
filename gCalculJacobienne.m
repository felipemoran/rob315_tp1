function [jacob] = gCalculJacobienne(alpha, dist, theta, radius, type_liaison, N_articulations, vitesses_articulations)
    %GCALCULJACOBIENNE Summary of this function goes here
    % Tous les 5 premiers arguments sont des tableaux de dimension N_reperes
    % Vitesses est de dimension N_articulations
    % type_liaison(i) donne le type de lien de R(i) avec R(i-1): 
    %       - 0 pas de liaison
    %       - 1 liaison rotoïde
    %       - 2 prismatique
    % 
    N_reperes = size(alpha);
    N_articulations = 0;
    jacob = zeros();
    t_final, t_intermediaires, t_elementaires = CalculMGD(alpha, dist, theta, radius);

    for i_rep = 1:N_reperes
        if type_liaison(i_rep) == 1
            N_articulations = N_articulations + 1;
            jacob(N_articulations) = ComposanteRotoide(i_rep, t_elementaires);
        elseif type_liaison(i_rep) == 2
            disp('not supported')
        else
            disp('Fixed frame - no effect on jacobian')
        end
    end
end

function [compo] = ComposanteRotoide(i_repere, trans_elem)
    dim_trans_elem = size(trans_elem);
    disp(dim_trans_elem);
    trans_0_i = eye(4);
    trans_i_E = eye(4);
    for j = 1:i_repere
        trans_0_i = trans_0_i * squeeze(trans_elem(j))
    end
    for j = i_repere+1:
        trans_0_i = trans_0_i * squeeze(trans_elem(j))
    end


end
