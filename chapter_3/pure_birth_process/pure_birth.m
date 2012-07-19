% pure_birth
%
%   [t X] = pure_death(X0, c)
%       Returns a vector of times and states for the exact stochastic
%       simulation algorithm in a pure-birth process. Here X0 denotes the
%       initial number of molecules and c is the rate constant.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_process
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston

function[tvals Xvals]=pure_birth(X0, c);
    X=X0;
    tvals(1)=0;
    Xvals(1)=X;
    i=1;
    t=0;
    while X<100  
    a=c*X;        
    tau=-log(rand)/a;
    t=t+tau;
    X=X+1;
    i=i+1;
    tvals(i)=t;
    Xvals(i)=X;
    end
end
