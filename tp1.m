%% q3
q0 = [0 0 0 0 0 0];

%% Q4
qi = [-pi/2 0      -pi/2 -pi/2 -pi/2 -pi/2].';
qf = [0     -pi/4  0     pi/2  pi/2  0].';



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
jacob_i = CalculJacobienne(params_i)
torseur_i = jacob_i * vitesse

params_f = ParamsFromQ(qf)
jacob_f = CalculJacobienne(params_f)
torseur_f = jacob_f * vitesse


% VisualisationBras(qi);
% pause
VisualisationEllipsoides(qf );


% Q7
% params_i = ParamsFromQ(qi);
% t_0E_i = CalculMGD(params_i{:});
% X_0E_i = t_0E_i(1:3,4);

% [q_mgi, X_mgi, dist_mgi, k] = MGI(X_0E_i, qf, 100000, 0.01, 0.0001)
% q_mgi
% qi

% X_mgi
% X_0E_i

% params_mgi = ParamsFromQ(q_mgi);
% t_0E_mgi = CalculMGD(params_mgi{:});
% X_0E_mgi = t_0E_mgi(1:3,4)
