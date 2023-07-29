function inter = lagrange_interpol(x,y,new_x)
%lagrange 보간법
%inter = largrange_interpol(x,y,new_x)
%x,y: 데이터 벡터
%new_x: 보간하려는 값
%inter: 출력변수
n=length(x);
sum=0;
for i=1:n
    temp=y(i);
    for j=1:n
        if(i~=j)
            temp = temp*(new_x-x(j))/(x(i)-x(j));
        end
    end
    sum=sum+temp;
end
inter=sum;
end