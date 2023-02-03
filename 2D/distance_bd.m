%This is the code used to make Figure S2b from the manuscript
%"Binding Kinetics of Harmonically Confined Systems" by Sensale, Sharma and Arya. 
%Any bugs or questions please send to sebastiansensalerodriguez@gmail.com
%Code written by Sebastian Sensale

clc;clear;reset(RandStream.getGlobalStream, sum(100*clock));
for factor=1:1
    trajectories=500;D=1;delta=1/5;limit=0.2;separation=1;kbeta=1;
    for i=1:trajectories
        j=1;nostop=1;timeA(1)=0;timeB(1)=0;
        f=initial(delta,limit,separation,kbeta);
        coordA(1,1)=f(1);coordA(1,2)=f(2);coordB(1,1)=f(3);coordB(1,2)=f(4);
        
        while nostop
            j=j+1;
            [dtA,probA]=timecont(D,delta,coordA(j-1,:),0,kbeta);
            [dtB,probB]=timecont(D,delta,coordB(j-1,:),separation,kbeta);
            
            timeA(j)=timeA(j-1)+dtA;
            timeB(j)=timeB(j-1)+dtB;
            coordA(j,:)=step(probA,delta,coordA(j-1,:));
            coordB(j,:)=step(probB,delta,coordB(j-1,:));
            [timedomain,nostop,endtime,idmax]=sorter(timeA,timeB,coordA,coordB,limit);
            
            if idmax>=5
                timeA([1:idmax-2])=[];			
                timeB([1:idmax-2])=[];
                coordA([1:idmax-2],:)=[];
                coordB([1:idmax-2],:)=[];
                j=size(timeA,2);
            end;            
            clearvars -except j timeA timeB coordA coordB i trajectories nostop D delta limit endtime  TIM factor separation kbeta
        end;
        
        TIM(i)=endtime;
        clearvars -except TIM i trajectories factor D delta limit separation kbeta
    end;
    Tim=TIM(TIM~=0);
    mu(factor)=mean(nonzeros(Tim));
    nombre=strcat('table',num2str(factor),'.txt');
    fid = fopen(nombre, 'w');
    for i=1:size(Tim,2)
        fprintf(fid, '%f\n', Tim(i));
    end;
    fclose(fid);
    clearvars -except mu factor separation
end;


    nombre=strcat('table.txt');
    fid = fopen(nombre, 'w');
    for i=1:size(mu,2)
        fprintf(fid, '%f\n', mu(i));
    end;
    fclose(fid);



