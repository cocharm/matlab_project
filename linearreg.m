function [a0,a1,r] = linearreg(x,y)
%직선 회기분석 (최소 자승법)
%r : 상관계수 (떨어져 있는 정도)
%x,y
n=length(x);
%sum_x = sum(x); %sum_y = sum(y); %sun_xx(x,*x); %sum_xy=sum(x,*y);
sum_x=0; sum_y=0; sum_xx=0; sum_xy=0;
for i=1:n
    sum_x = sum_x+x(i);
    sum_y = sum_y+y(i);
    sum_xx = sum_xx+x(i)^2;
    sum_xy = sum_xy+x(i)*y(i);
end
a0 = (sum_xx*sum_y-sum_xy*sum_x)/(n*sum_xx-sum_x^2);
a1 = (n*sum_xy-sum_x*sum_y)/(n*sum_xx-sum_x^2);

%상관계수 r구하기
ave_x = sum_x/n;
ave_y = sum_y/n;
coe1 = 0; coe2 = 0; coe3 = 0;
for i=1:n
    coe1 = coe1+(x(i)-ave_x)*(y(i)-ave_y);
    coe2 = coe2+(x(i)-ave_x)^2;
    coe3 = coe3+(y(i)-ave_y)^2;
end

r=coe1/(sqrt(coe2)*sqrt(coe3));
fprintf('최소자승법에 의한 직선식 p(x) = %.6f + %.6f*x\n',a0,a1);
fprintf('상관계수 R = %.3f\n',r);
plot(x,y,'b o'); %plot(x,y,'b .');
hold on;
yy = a0+a1.*x; %a1.*x ,,,,  각 요서에 곱해주기 위해서

plot(x,yy,'r');
xlabel('x값');
ylabel('y값');
title('1차 회귀분석 그래프');
%gtext('yy=a0+a1.*x'마우스로 클릭해서 문자표시');
gtext('p(x) = a0 + a1*x 선형 회분석');
hold off;
end