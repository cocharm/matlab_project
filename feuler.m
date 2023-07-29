function [x,y] = feuler(f,x0,y0,xn,h)
%f : 1계 1차 상미분 방정식
% x0 : x의 초기치
% xn : x의 최종값
% y0 : y의 초기치
% h : delta x (간격)
% [x,y] = feuler('ff',x0,y0,xn,h) <- 이런식으로 명령창에 입력하기

%f = @(x) 4*exp(0.8*x)-0.5*y;
disp('---------------')
disp('  Euler method')
disp('---------------')
disp('  x        y')
n=fix((xn-x0)/h)+1;
x=linspace(x0,xn,n)';
y=zeros(n,1);
y(1)=y0;
for i=2:n
    y(i)=y(i-1) + h*feval(f,x(i-1),y(i-1));
    fprintf('%6.4f  %6.4f\n',x(i-1),y(i-1));
end
fprintf('%6.4f  %6.4f\n',x(end),y(end));
end