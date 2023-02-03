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
    timedomain(:,3)=interp1(timeA,coordA(:,2),timedomain(:,1));
    timedomain(:,4)=interp1(timeB,coordB(:,1),timedomain(:,1));
    timedomain(:,5)=interp1(timeB,coordB(:,2),timedomain(:,1));	
    timedomain(any(isnan(timedomain), 2), :) = [];
    for i=1:size(timedomain(:,1),1)
        timedomain(i,6)=pdist([timedomain(i,2),timedomain(i,3);timedomain(i,4),timedomain(i,5)],'euclidean');
        if timedomain(i,6)<=limit
            timedomain(i,7)=1;
            nostop=0;
            endtime=min(timedomain(i,1),endtime);
        end;
    end;
end


