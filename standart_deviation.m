x=[23;3;64;45;78;80;84;98;100;3;5;0;2;20;27;30;41;43;93;95;28;10;9;12];
n=24;
sum=0;
for i=1:n
    sum=sum+x(i);
end
mean=sum/n;
sum_sd=0;
for i=1:n
    sum_sd=sum_sd+(x(i)-mean)^2;
end
s_d=sqrt(sum_sd/(n-1));
s_d
