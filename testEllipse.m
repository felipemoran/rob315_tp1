qi = [-pis2 0 -pis2 -pis2 -pis2 -pis2].';
params_i = ParamsFromQ(qi);
t_final = CalculMGD(params_i{:});
xc = t_final(1,4);
yc = t_final(2,4);
zc = t_final(3,4);

[x0, y0, z0] = ellipsoid(xc, yc, zc, 2, 1, 1);
% surf(x0, y0, z0)

pts_0 = [x0(:) y0(:) z0(:)].';

pts_E = t_final(1:3,1:3) * pts_0;
% [x_El y_El z_El] = [ pts_E(2,:) pts_E(3,:)];
x_El = pts_E(1,:);
y_El = pts_E(2,:);
z_El = pts_E(3,:);
x_E = reshape(x_El, [21,21]);
y_E = reshape(y_El, [21,21]);
z_E = reshape(z_El, [21,21]);
% pause
surf(x_E, y_E, z_E);
VisualisationBras(qi)
