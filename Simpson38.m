function area = Simpson38(x1,x2,n)
%Simpson3/8 수치적분
%f = 함수
%n = 3의 배수

%f=@(x) 14*x^6+7;
h=(x2-x1)/n;
for i=0:n
    x=x1+h*(i);
    y(i+1)=f(x);
end

n=length(y);

sum = y(1)+y(n);
for i=2:3:n-1
    sum=sum+3*(y(i)+y(i+1));
end

for i=4:3:n-2
    sum=sum+2*y(i);
end
area = 3*h/8*sum;
fprintf('함수의 적분값 = %10.6f\n',area);
end