    %Parameters
    c(1)=1.5e-3;
    c(2)=1e-4;
    c(3)=0.1;
    
    %Simulation parameters
    a = zeros(3, 1);
    dv = zeros(3, 1);
    V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];    %state change vector
    
    %Allocating memory 
    
    X = zeros(4,1);
    
    index = 1;                         %index to keep track of tv and xv
    list = mm_dlList;                %Name of Arraylist to store delayed time and reactions
    
    %Set up
    t = 0;
    X(1) = 200;                       %Initial number of molecules is 10;
    X(2)=100;
    Xvals=zeros(4,1);
    Xvals(1,1)=X(1);
    Xvals(2,1)=X(2);
    e=0.03;
    %Simulation
    while t<100
    a(1) = c(1)*X(1)*X(2);
    a(2) = c(2)*X(3);
    a(3) = c(3)*X(3);
    mean=abs(V(1,1)*a(1)+V(1,2)*a(2)+V(1,3)*a(3));
    var=a(1)*(V(1,1))^2+a(2)*(V(1,2))^2+a(3)*(V(1,3))^2;
    tau=min(max(e*X(1)/2,1)/mean,(max(e*X(1)/2,1))^2/var);
    nextt=inf;
        if list.fill>0
            for i=1:list.fill
                nextt(i)=list.t(i)-t;
            end
        end
    if tau<nextt
        t=t+tau;
        dv(1)=rand;
        dv(2)=rand;
        dv(3)=rand;
                for k1=1:3
                    skip(k1)=poissrnd(tau*a(k1));
                    if skip(k1)>0
                    list=add(list, t+dv(k1),k1,skip(k1));   %k1 is the type of rxn skipped, in the newlist object, should create one more vector
                    end
                end    
         
    else
            go=length(find(nextt<=tau));
            for l=1:go
                event=list.j(l);
                occr=list.occ(l);
                change(:,l)=V(:,event)*occr;
                X=X+change(:,l);
            end
            
			gomax=max(find(nextt<=tau));
			t=list.t(gomax);
			%update list
			for k2=1:go
			list=remove(list);
            end         
    end  
    index=index+1;
    tvals(index)=t;
    Xvals(:,index)=X;
    end
    plot(tvals, Xvals(1,:),'r', 'LineWidth', 2); hold on;
%     plot(tvals, Xvals(2,:),'LineWidth', 2);
%     plot(tvals, Xvals(3,:),'black','LineWidth', 2);
    plot(tvals, Xvals(4,:),'g','LineWidth', 2);
    