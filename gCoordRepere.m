function [ rep0_pts ] = CoordRepere( Q )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pts = [0 1 0 0 0 0;...
       0 0 0 1 0 0;...
       0 0 0 0 0 1;...
       0 0 0 0 0 0];
transform = CalculMGDfromQ(Q);
rep0_pts = transform*pts;
end

