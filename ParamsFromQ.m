function parameters = ParamsFromQ(Q)
%PARAMSFROMQ Génère la paramétrisation de Khalil-Kleinfinger 
% Inputs:
%   Q : tableau des positions articulaires des différents actionneurs
% Outputs
%   parameters : structure contenant les champs alpha,d,theta,r de la paramétrisation
%   
parameters = struct;
parameters.alpha = [0 1.57 0 1.57 -1.57 1.57 0];
parameters.d = [0 0 0.7 0 0 0 0];
parameters.theta = [Q(1) Q(2) Q(3)+1.57 Q(4) Q(5) Q(6) 0];
parameters.r = [.5 0 0 .2 0 0 .1];
% parameters.rE = .1;
end

