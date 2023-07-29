function y = rectang_int(x1,x2,dx)
%직사각형 적분법
%f 함수 콜하게끔 설정 해야 함!!!
%x1 : 아랫값 // x2 : 윗값 // dx : 간격
%f = @(x) 1/(x^2+1);
num=(x2-x1)/dx;
sum=0;
for i=1:num+1
    x(i)=x1+(i-1)*dx;
    yy(i)=f(x(i));
    sum=sum+yy(i);
end
y=sum*dx;
plot(x,yy)
end
