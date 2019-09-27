function c = prob(min,max,val)
    if val < min+(max-min)*2/3
        c = (val-min) * 1/((max-min)*2/3);
    else
        c = (max-val)*1/((max-min)*1/3);
    end
end