function [x_E, y_E, z_E] = Ellipse3d(xc, yc, zc, xr, yr, zr, rotate_matrix)
    % Génération des coordonnées de la surface d'une ellipse en 3D
    % Inputs:
    %   xc 
    %   yc 
    %   zc : coordonnées x,y,z du centre de l'ellipse

    %   xr
    %   yr
    %   zr : rayons de l'ellipse dans les 3 axes orthogonaux xr, yr, zr

    %   rotate_matrix : matrice orthogonale 3x3 donnant les coordonnées des axes xr,yr,zr dans le repère global
    % Outputs:
    %   x_E
    %   y_E
    %   z_E : coordonnées x,y,z de la surface de l'ellipse. Plottables avec 
    %           > surf(x_E, y_E, z_E)

    [x0, y0, z0] = ellipsoid(0, 0, 0, xr, yr, zr);
    dim_surf = size(x0);
    pts_0 = [x0(:) y0(:) z0(:)].';
    pts_E = rotate_matrix * pts_0;
    x_El = pts_E(1, :) + xc;
    y_El = pts_E(2, :) + yc;
    z_El = pts_E(3, :) + zc;
    x_E = reshape(x_El, dim_surf);
    y_E = reshape(y_El, dim_surf);
    z_E = reshape(z_El, dim_surf);
end
