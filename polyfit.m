x=[1;3;5;7;10;12;13;16;18;20];
y=[4;5;6;5;8;7;6;9;12;11];
p= polyfit(x,y,1); % burada 1 polinomun derecesini verir
yapp=p(2)+p(1)*x;
scatter(x,y,'ro') % burada scatter olacak ��nk� noktalar�n grafikler �zerindeki da��l�m�na bir regression olu�turacak ve buna g�re bir linear regression yapacaks�n
grid
hold on
plot(x,yapp,'r')

