function f=initial(delta,limit,separation,kbeta)
    lattice(1)=1E-6;
    for i=2:1000000
        lattice(i)=delta*i+lattice(1);
        lattice(1000000+i)=-delta*i+lattice(1);
    end;
    random=normrnd(0,sqrt(1/kbeta),[1,4]);
    random(3)=random(3)+separation;
    [val(1),idx(1)]=min(abs(lattice-random(1)));
    [val(2),idx(2)]=min(abs(lattice-random(2)));
    [val(3),idx(3)]=min(abs(lattice-random(3)));
    [val(4),idx(4)]=min(abs(lattice-random(4)));	
    f(1)=lattice(idx(1));%x1
    f(2)=lattice(idx(2));%y1
    f(3)=lattice(idx(3));%x2
    f(4)=lattice(idx(4));%y2
    nostop=1;
    while pdist([f(1),f(2);f(3),f(4)],'euclidean')<=limit
        random=normrnd(0,sqrt(1/kbeta),[1,4]);
        random(3)=random(3)+separation;
        [val(1),idx(1)]=min(abs(lattice-random(1)));
        [val(2),idx(2)]=min(abs(lattice-random(2)));
        [val(3),idx(3)]=min(abs(lattice-random(3)));
        [val(4),idx(4)]=min(abs(lattice-random(4)));	
        f(1)=lattice(idx(1));%x1
        f(2)=lattice(idx(2));%y1
        f(3)=lattice(idx(3));%x2
        f(4)=lattice(idx(4));%y2
	
    end;
end


