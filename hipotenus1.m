function hp=hipotenus1(x,y)

% Basit bir fonksiyon ornegi:
% Bir dik ucgenin hipotenusunu hesaplar
% hp: bir dik ucgenin hipotensusu
% x: birinci dik kenar
% y: ikinci dik kenar

%dik_kenar1_kare=x^2;
%dik_kenar2_kare=y^2;
%dik_kenar_kare_toplam=dik_kenar1_kare+dik_kenar2_kare;
%hp=sqrt(dik_kenar_kare_toplam);

hp=sqrt((x^2)+(y^2));

fprintf('\n\n Dik kenari %d ve %d olan bir dik ucgenin hipotenusu %d ye esittir \n\n',x,y,hp)



