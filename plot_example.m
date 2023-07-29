%그래프 띄우기
%함수 f 는 익명함수
%y=x^3-x^2-1
clear;
close;

t=[0:1/10:10]';

y=zeros(size(t));

for i=1:length(t)
    y(i)=f(t(i));
end
plot(t,y);
grid on;