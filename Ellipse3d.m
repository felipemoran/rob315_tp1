function [x_E, y_E, z_E] = Ellipse3d(xc, yc, zc, xr, yr, zr, rotate_matrix)

[x0, y0, z0] = ellipsoid(0, 0, 0, xr, yr, zr);
% surf(x0, y0, z0)

pts_0 = [x0(:) y0(:) z0(:)].';

pts_E = rotate_matrix * pts_0;
% [x_El y_El z_El] = [ pts_E(2,:) pts_E(3,:)];
x_El = pts_E(1,:) + xc;
y_El = pts_E(2,:) + yc;
z_El = pts_E(3,:) + zc;
x_E = reshape(x_El, [21,21]);
y_E = reshape(y_El, [21,21]);
z_E = reshape(z_El, [21,21]);
% pause
% surf(x_E, y_E, z_E);
% VisualisationBras(qi)
end