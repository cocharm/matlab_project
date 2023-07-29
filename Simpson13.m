function INTG = Simpson13(x1,x2,n)
%Simpson1/3 수치적분
%f = 함수
%n=2의 배수
%f=@(x) 14*x^6+7;
h=(x2-x1)/n;
sum=f(x1)+f(x2);
for i=1:2:n
    x=x1+h*(i);
    sum=sum+4*f(x);
end

for i=2:2:n-1
    x=x1+h*(i);
    sum=sum+2*f(x);
end
INTG = h/3*sum;
fprintf('함수의 적분값 = %10.6f\n',INTG);
end