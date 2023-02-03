function positions2=step(prob,delta,positions)
    r=rand(1);
    if r<=prob(1)
        positions2=positions+delta;
    else 
        positions2=positions-delta;
    end;
end


