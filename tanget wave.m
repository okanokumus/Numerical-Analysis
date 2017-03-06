clear all; close all; clc;
fm=60; % iþaretin frekansý 60 Hz'dir.
fs=100*fm; % sinyalin örnekleme frekansý yaklaþýk 100 kat olarak alýnýr
ts=1/fs;
n=0:ts:1;
faz=30; % 30
tsy=tan(2*pi*n*fm+faz);
plot(n,tsy,'k')
title('tangent wave with 30 degree phase')
xlabel('second')
ylabel('afd')