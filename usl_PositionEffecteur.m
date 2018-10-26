function X_e = PositionEffecteur(q)
    params = ParamsFromQ(q);
    t_final = CalculMGD(params);
    X_e = t_final(1:3,4)
end