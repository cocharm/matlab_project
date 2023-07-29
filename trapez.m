function rel = trapez(x1,x2,dx)
%사다리꼴 적분법
f=@(x) x^4-3*x^3+2*x^2-3
num=(x2-x1)/dx;
sum=0;
for i=1:num+1
    x(i)=x1+(i-1)*dx;
    y(i)=f(x(i));
end
sum=y(1)+y(end);
for j=2:num
    sum=sum+2*y(j);
end
plot(x,y)
rel=sum*dx/2;
end
