clear all; close all; clc;
fm=60; % i�aretin frekans� 60 Hz'dir.
fs=100*fm; % sinyalin �rnekleme frekans� yakla��k 100 kat olarak al�n�r
ts=1/fs;
n=0:ts:1;
faz=30; % 30
tsy=tan(2*pi*n*fm+faz);
plot(n,tsy,'k')
title('tangent wave with 30 degree phase')
xlabel('second')
ylabel('afd')