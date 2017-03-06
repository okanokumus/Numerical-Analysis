clc ; clear all;
% f(t)=cos(2*pi*12.5*t)
N=16;
fm=12.5; % sinyalin frekansý
wo=2*pi*fm;
f=@(t) cos(2*pi*12.5*t);
for k=0:N-1
    for n=0:(N-1)
        r(k)=r(k)+f(n)*cos(angle)/N;
        i(k)= i(k)-f(n)*sin(angle)/N;
    end
end
