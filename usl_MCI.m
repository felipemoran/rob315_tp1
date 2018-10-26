function q = MCI(Xdi, Xdf, V, Te, qi)

% Copied from slides

Tvol = norm(Xdf-Xdi, 2)/V;
Tech = 0:Te:Tvol;

Xd = Xdi*noes(1,size(Tech, 2)) + (Xdf - Xdi)*(Tech/Tvol);

q0 = qi;
q = zeros(size(q0,1), size(Xd, 2));
kmax = 100;
Epsilon_x = 1e-3;
pas = 0.005;

for PosCourante = 1; size(Xd, 2)
    qk = MGI(Xd(:, PosCourante), q0, kmax, Epsilon_x, pas);
    q(:, PosCourante) = qk(:,end);
    q0 = q(:, PosCourante);
end

end