function parameters = ParamsFromQ(Q)
%PARAMSFROMQ Generates body parameters from Q command
parameters = struct;
parameters.alpha = [0 1.57 0 1.57 -1.57 1.57 0];
parameters.dist = [0 0 0.7 0 0 0 0];
parameters.theta = [Q(1) Q(2) Q(3)+1.57 Q(4) Q(5) Q(6) 0];
parameters.radius = [.5 0 0 .2 0 0 .1];
% parameters = {alpha, dist, theta, radius};
end

