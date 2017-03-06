clear all
close all

% fft Example
n=8; dt=0.02; fs=1/dt; T = 0.16;
tspan=(0:n-1)/fs; % omits the last point
y=5+cos(2*pi*12.5*tspan)+sin(2*pi*31.25*tspan);
subplot(3,1,1); % help subplot % figür penceresini 3'e ayýr ve ilki ile ilgilen
plot(tspan,y,'-og','linewidth',2);
title('(a) f(t) versus time (s)'); grid;
Y=fft(y)/n;
nyquist=fs/2;fmin=1/T;
f = linspace(fmin,nyquist,n/2);
Y(1)=[];YP=Y(1:n/2);
subplot(3,1,2)
stem(f,real(YP),'linewidth',2,'MarkerFaceColor','blue')
grid;title('(b) Real component versus frequency')
subplot(3,1,3)
stem(f,imag(YP),'linewidth',2,'MarkerFaceColor','blue')
grid; title('(b) Imaginary component versus frequency')
xlabel('frequency (Hz)')