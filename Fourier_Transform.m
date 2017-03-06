% Fourier transform
clear all; close all; clc;
fm=10; % i�aretin frekans� 60 Hz'dir.
fs=100*fm; % sinyalin �rnekleme frekans� yakla��k 100 kat olarak al�n�r
ts=1/fs;
n=0:ts:1;
faz=0; % 30
tsy=cos(2*pi*n*fm+faz); % w=2*pi*fm >> angular frequency
% cos((pi/2)-a)=cos(a-(pi/2))
tsyf=fft(tsy)/length(tsy); % sinyalin frekans izgesinde g�sterilimi
tsyfm=abs(tsyf); % Sinyalin fourier d�n���m� yap�l�nca karma��k faz temizle
for i=1:(fs+1);
    if abs(tsyf(i))<0.01;
    tsyf(i)=0;
    end
end
tsyfa=angle(tsyf);
figure
subplot(2,1,1)
plot(tsyfm);
AXIS([0 100 0 1])
title('Sekil 2a');
%text(3000,0.3,'-pi +pi araligi i�in ')
SUBPLOT(2,1,2)
plot(tsyfa);
AXIS([0 100 -2 2])
title('Sekil 2b');
xlabel('Hertz');
% Sinyalin frekans�n�n bulunmas�
[A,B]=max(tsyfm(1:(fs/2)));
disp('Sinyalin frekansi')
disp(B-1)
tsyfa(B)

% �ekil 2.2.a.� da sinyalin frekans cevab�n�n mutlak de�eri �izilmi�ken �ekil 2.2.b.� de faz
% cevab� �izilmi�tir. Burada dikkat edilmesi gereken husus faz cevab� bulunurken �rnekleme
% frekans�n�n yeterince b�y�k se�ilmesinin gereklili�idir.