function inter = newton_interpol_1(x,y,new_x)
%newton 보간법 (분할 차분표)
% x,y: 입력 데이터
% new_x : 보간하고자 하는 x
n=length(x);
b=zeros(n,n);
b(:,1)=y(:);

%분할 차분표 Logic
for i=2:n
    for j=1:n-i+1 %차분표에서 열 이동 (i+1)
        b(j,i)=(b(j+1,i-1)-b(j,i-1))/(x(i+j-1)-x(j));
    end
end

%계산 Logic (분할 차분 형태식)
product = 1;
inter=b(1,1);
for j=1:n-1
    product = product*(new_x-x(j));
    inter = inter + product*b(1,j+1);
end
end