function [dt,prob]=timecont(D,delta,coord,kbeta)
        if abs(coord)<delta/2
            kf=D/delta^2;
            kb=D/delta^2;
        else
            kf=(D*kbeta*coord/delta)/(exp(kbeta*coord*delta)-1);
            kb=-(D*kbeta*coord/delta)/(exp(-kbeta*coord*delta)-1);          
        end;
    suma=kf+kb;
    dt=exprnd(suma^-1);
    prob=kf/suma;
end


