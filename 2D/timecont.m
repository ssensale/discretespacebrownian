function [dt,prob]=timecont(D,delta,coord,dx,kbeta)
    for i=1:1
        if abs(coord(i)-dx)<delta/2
            kf(i)=D/delta^2;
            kb(i)=D/delta^2;
        else
            kf(i)=(D*kbeta*(coord(i)-dx)/delta)/(exp(kbeta*(coord(i)-dx)*delta)-1);
            kb(i)=-(D*kbeta*(coord(i)-dx)/delta)/(exp(-kbeta*(coord(i)-dx)*delta)-1);          
        end;
    end;
    for i=2:2
        if abs(coord(i))<delta/2
            kf(i)=D/delta^2;
            kb(i)=D/delta^2;
        else
            kf(i)=(D*kbeta*coord(i)/delta)/(exp(kbeta*coord(i)*delta)-1);
            kb(i)=-(D*kbeta*coord(i)/delta)/(exp(-kbeta*coord(i)*delta)-1);          
        end;
    end;    
    suma(1)=kf(1)+kf(2)+kb(1)+kb(2);
    dt=exprnd(suma^-1);
    prob(1)=kf(1)/suma;
    prob(2)=kb(1)/suma;
    prob(3)=kf(2)/suma;
    prob(4)=kb(2)/suma;
end


