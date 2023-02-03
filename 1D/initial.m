function f=initial(delta,limit,separation,kbeta)
    lattice(1)=1E-6;
    for i=2:1000000
        lattice(i)=delta*i+lattice(1);
        lattice(1000000+i)=-delta*i+lattice(1);
    end;
    random=normrnd(0,sqrt(1/kbeta),[1,2]);
    random(2)=random(2)+separation;
    [val(1),idx(1)]=min(abs(lattice-random(1)));
    [val(2),idx(2)]=min(abs(lattice-random(2)));	
    f(1)=lattice(idx(1));%x1
    f(2)=lattice(idx(2));%y1
    nostop=1;
    while pdist([f(1);f(2)],'euclidean')<=limit
        random=normrnd(0,sqrt(1/kbeta),[1,2]);
        random(2)=random(2)+separation;
        [val(1),idx(1)]=min(abs(lattice-random(1)));
        [val(2),idx(2)]=min(abs(lattice-random(2)));
        f(1)=lattice(idx(1));%x1
        f(2)=lattice(idx(2));%y1	
    end;
    
end


