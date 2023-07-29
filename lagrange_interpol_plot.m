%lagrange 보간법 그래프 작성
close all;
i=0;
x=2:4;
y=log10(x);
for k=2:1/100:4
    i=i+1;
    ip_y(i)=lagrange_interpol(x,y,k);
end
xx=2:1/100:4;
yy=log10(xx);
ip_x=2:1/100:4;
grid on;
hold on;
plot(x,y,'color','k');
plot(ip_x,ip_y,'color','r');

plot(xx,yy,'color','b');
hold off;