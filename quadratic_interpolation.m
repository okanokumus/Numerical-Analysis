% quadratic interpolation
clc;clear all;
x0=1; x1=4; x2=6;
f=@(x) log(x); % MATLAB da ln(x) bu þekilde yazýyoruz.
x=x0:0.01:x1:0.01:x2 +1; % burada +1 deðerini yazmamýzýn nedeni ln(x) fonksiyonunu devam ettirmek diðer türlü tam kesiþeceklerdi.Yap da gör.
plot(x,f(x),'b')
hold on
b0=f(x0);
b1=(f(x1)-f(x0))/(x1-x0);
b2=((f(x2)-f(x1))/(x2-x1)-(b1))/(x2-x0);
y1=b0+b1*(x-x0);
y2=b0+b1*(x-x0)+b2*(x-x0).*(x-x1); % burada (.*) çok çok önemli eleman elemana çarp anlamýnda o yüzden aman dikkat
plot (x,y2,'r')
hold off
grid
AXIS([0 9 -1 3]) % we can change the limits of interval of independent variables benefit from this.
b0
b1
b2
% burada y2(x) grafiðini göremedim. Elbette göremezsin çünkü yukarýda .* yapmadýðýn için matris 
% çarpýmýnda hata veriyor.