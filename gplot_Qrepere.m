function [ ] = plot_Qrepere( Q , format)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
pts = CoordRepere(Q);
disp(pts);
plot3(pts(1, :), pts(2,:), pts(3,:), format)


end

