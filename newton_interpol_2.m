function inter = newton_interpol_2(x,y,new_x)
%newton 보간법 (전향 차분표)
% x,y: 입력 데이터
% new_x : 보간하고자 하는 x
n=length(x);
b=zeros(n,n);
b(:,1)=y(:);
h=x(2)-x(1);

%전향 차분표
for i=2:n
    for j=1:n-i+1
        b(j,i)=(b(j+1,i-1)-b(j,i-1));
    end
end
product = 1;
inter=b(1,1);
for j=1:n-1
    product = product/(factorial(j)*h^j)*(new_x-x(j));
    inter = inter + product*b(1,j+1);
end
end