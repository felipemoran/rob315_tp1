pis2 = 3.1415927;
%% q3
q = [0 0 0 0 0 0];
pr
CalculMGDfromQ(q)

%% Q4
qi = [-pis2 0 -pis2 -pis2 -pis2 -pis2].';
qf = [0 -pis2/2 0 pis2 pis2 0].';

disp('initiale');
% paramsInit = ParamsFromQ(qi);
VisualisationBras(qi);

disp('finale');
% CalculMGDfromQ(qf);
VisualisationBras(qf);

%% Q5
hold on
plot_Qrepere(qi, 'g');
plot_Qrepere(qf, 'b');
plot_Qrepere(q, 'r');
hold off