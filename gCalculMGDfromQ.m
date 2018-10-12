function [ final_trans ] = CalculMGDfromQ( Q )
%CALCULMGDFROMQ Summary of this function goes here
%   Detailed explanation goes here
alpha = [0 1.57 0 1.57 -1.57 1.57 0];
dist = [0 0 0.7 0 0 0 0];
theta = [Q(1) Q(2) Q(3)+1.57 Q(4) Q(5) Q(6) 0];
ray = [.5 0 0 .2 0 0 .1];

final_trans = CalculMGD(alpha, dist, theta, ray);

end

