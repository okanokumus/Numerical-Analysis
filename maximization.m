clear; clc;
xlow=0; xhigh=4;
maxit=100; es=0.0001;
f=@(x) 2*sin(x)-(x^2)/10;
R=(sqrt(5)-1)/2;
xl=xlow; xu=xhigh;
iter=1;
d=R*(xu-xl);
x1=xl+d ; x2=xu-d;
f1=f(x1); f2=f(x2);
if f1>f2 % if f1<f2 ise minimization olurdu
    xopt=x1; % opt=optimum 
    fx=f1;
else
    xopt=x2;
    fx=f2;
end
while (1) %sonsuz döngüye gir
    d=R*d; % artýk aradaki fark d olduðu için (xu-xl)=d olur 
    xint=xu-xl;
    if f1>f2 % if f1<f2 ise minimization olurdu
        xl=x2;
        x2=x1;
        x1=xl+d;
        f2=f1;
        f1=f(x1);
    else 
        xu=x1;
        x1=x2;
        x2=xu-d;
        f1=f2;
        f2=f(x2);
    end
    iter=iter+1;
    if f1>f2  % if f1<f2 ise minimization olurdu
        xopt=x1;
        fx=f1;
    else
        xopt=x2;
        fx=f2;
    end
    if xopt~=0 % xopt 0'a eþit deðilse 
        ea=(1-R)*abs(xint/xopt)*100;
    end
    if ea<=es || iter >=maxit
        break % pseudocode daki EXIT anlamýna gelir
    end
    
end
    result=xopt    
    
    
    
    

