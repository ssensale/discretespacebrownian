function [timedomain,nostop,endtime,idmax]=sorter(timeA,timeB,coordA,coordB,limit)
    nostop=1;endtime=NaN;
     [timemax1,idmax1]=max(timeA);
     [timemax2,idmax2]=max(timeB);
     timemin=min(timemax1,timemax2);
     if timemin==timemax1
        i=1;
        while and(i<=idmax1,timeB(i)<timemin)
            i=i+1;
        end;
         idmax=i;
     else
        i=1;
        while and(i<=idmax2,timeA(i)<timemin)
            i=i+1;
        end;
         idmax=i;
     end;    
    
    
    
    timedomain(:,1)=sort(unique(cat(1,timeA(:),timeB(:))));
    timedomain(:,2)=interp1(timeA,coordA(:,1),timedomain(:,1));
    timedomain(:,3)=interp1(timeB,coordB(:,1),timedomain(:,1));
    timedomain(any(isnan(timedomain), 2), :) = [];
    for i=1:size(timedomain(:,1),1)
        timedomain(i,4)=timedomain(i,2)-timedomain(i,3);
    end;
    for i=2:size(timedomain(:,1),1)    
        if limit==0
            if sign(timedomain(i,4)-limit)~=sign(timedomain(i-1,4)-limit)
                timedomain(i,5)=1;
                nostop=0;
                endtime=min(timedomain(i,1),endtime);            
            end;
        else
            if abs(timedomain(i,4))<=limit
                timedomain(i,5)=1;
                nostop=0;
                endtime=min(timedomain(i,1),endtime);                   
            end;
        end;
    end;
end


