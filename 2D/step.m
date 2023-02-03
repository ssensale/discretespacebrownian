function positions2=step(prob,delta,positions)
    positions2=positions;
    r=rand(1);
    if r<=prob(1)
        positions2(1)=positions(1)+delta;
    else 
        if r<=prob(1)+prob(2)
            positions2(1)=positions2(1)-delta;
        else
            if r<=prob(1)+prob(2)+prob(3)
                positions2(2)=positions2(2)+delta;
            else
                positions2(2)=positions2(2)-delta;
            end;
        end;
    end;
end


