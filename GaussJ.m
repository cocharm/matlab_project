%가우스조단 소거법으로 선형방정식 해 구하기
%x = GaussJ(A,b)
%A=계수 행렬
%b=상수 행렬 (열벡터)
%x=연립방정식의 근

function x = GaussJ(A,b)
[m1,k1]=size(A);  % 첫번째 요소는 m1, 두번째 요소는 k1에 넣는다
[m2,k2]=size(b);  % 첫번째 요소는 m2, 두번째 요소는 k2에 넣는다
x=zeros(m1,k2);

%상삼각 행렬로 만듬 대각행렬 아래를 0으로 만든다
for i=1:m1-1
    m=-A(i+1:m1,i)/A(i,i);
    A(i+1:m1,:)=A(i+1:m1,:)+m*A(i,:);
    b(i+1:m2,:)=b(i+1:m2,:)+m*b(i,:);
end

%대각상위 부분을 0으로 만듬
for i=1:m1
    for j=i+1:k1
        m=-A(i,j)/A(j,j);
        A(i,:)=A(i,:)+m*A(j,:);
        b(i,:)=b(i,:)+m*b(j,:);
    end
end

%근을 구함
for k=1:m1
    x(k)=b(k)/A(k,k);
end
end