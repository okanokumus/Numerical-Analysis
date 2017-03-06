clear all
clc
format short eng

% Example 6.1 in pp 147
%Initial parameters
x0=0;
es=0.01;
imax=100;
fonk=@(x) exp(-x)-x


% routine starts
g=@(x2) x2+fonk(x2); 

xr=x0;
iter=0;
result_table=[]; %will include [iter xr ea]
while (1)
    xrold=xr;
    xr=g(xrold);
    iter=iter+1;
    if xr~=0
        ea=abs((xr-xrold)/xr)*100;
    end
    if ((ea<es) | (iter>=imax))
        break
    end
    result_table=[result_table; [iter xr ea]];
end
result_table