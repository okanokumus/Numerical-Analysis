function [hp,aci_rad,aci_deg]=hipotenus2(x,y)

%Birden fazla giris ve cikis iceren ornek bir program
%
% Bir dik ucgenin hipotenusunu ve aradaki aciyi hesaplar
%Girisler:
% x: birinci dik kenar
% y: ikinci dik kenar
%Cikislar:
% hp: hipotenus
% aci_rad: aci degeri radyan cinsinden
% aci_deg: aci degeri derece cinsinden


hp=sqrt((x^2)+(y^2));

aci_rad=atan(y/x);
aci_deg=aci_rad*180/pi;

% fprintf komutunda %f gosterimini kullanabilirsiniz
fprintf('\n\n Dik kenari %d ve %d olan bir dik ucgenin:\n   hipotenusu = %1.3f birim \n   acisi = %1.4f derece \n\n',x,y,hp,aci_deg)



