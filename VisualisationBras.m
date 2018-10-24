function [ ] = VisualisationBras(Q)
%VISUALISATIONREPERE dessin 3D d'un repere associé a une certaine position
% de l'espace
%   Detailed explanation goes here
param = ParamsFromQ(Q);
[~, ~, intermediaires] = CalculMGD(param{:});
num_reperes = size(intermediaires, 1);
hold on;
patch([1 -1 -1 1], [1 1 -1 -1], [0 0 0 0], [1 .5 0 .5]);
Plot_Bras(intermediaires);
for i = 1:num_reperes
    repere_intermediaire = intermediaires(:,:,i);
    pts = CoordRepere(repere_intermediaire);
    Plot_Repere(pts, i-1);
end
title('Visualisation Bras Articulé');
xlabel('x');
ylabel('y');
zlabel('z');
hold off;
end

function [] = Plot_Repere(pts, index_repere)
color_list = ['b', 'r', 'g'];
hold on;
for i = 1:3
    filter_ax = false(1, 4);
    filter_ax(1) = true;
    filter_ax(1+i) = true;
    % disp(filter_ax);
    % disp(pts(:, filter_ax));
    
    plot3(pts(1,filter_ax), pts(2,filter_ax), pts(3,filter_ax), color_list(i));
    text(pts(1,1), pts(2,1), pts(3,1), 'R'+string(index_repere));
end

end

function [] = Plot_Bras(reperes_intermediaires)
x = squeeze(reperes_intermediaires(1, 4, :));
y = squeeze(reperes_intermediaires(2, 4, :));
z = squeeze(reperes_intermediaires(3, 4, :));
% disp(x)
disp([x y z]);
plot3(x, y, z, 'm--', 'LineWidth', 4);
end

function [ rep0_pts ] = CoordRepere(transform )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pts = [0 .25 0 0;...
       0 0 .25 0;...
       0 0 0 .25;...
       1 1 1 1];
% disp transform;
% disp(transform);
rep0_pts = transform*pts;
end
