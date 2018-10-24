pis2 = 3.1415927;
%% q3
q = [0 0 0 0 0 0];

%% Q4
qi = [-pis2 0 -pis2 -pis2 -pis2 -pis2].';
qf = [0 -pis2/2 0 pis2 pis2 0].';



% disp('initiale');
% % paramsInit = ParamsFromQ(qi);
% VisualisationBras(qi);

% disp('finale');
% % CalculMGDfromQ(qf);
% VisualisationBras(qf);

% Q6
vitesse = [.5 1 -.5 .5 1 -.8].';
% Qi
params_i = ParamsFromQ(qi)
jacob_i = gCalculJacobienne(params_i{:})
torseur_i = jacob_i * vitesse

params_f = ParamsFromQ(qf)
jacob_f = gCalculJacobienne(params_f{:})
torseur_f = jacob_f * vitesse


VisualisationBras(qi)
