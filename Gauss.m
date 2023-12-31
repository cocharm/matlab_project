%가우스 소거법으로 선형방정식 해 구하기
%x=Gauss(A,b)
%A=계수 행렬
%b=상수 행렬 (열벡터)
%x=연립방정식의 근
function x=Gauss(A,b)

[m1,k1]=size(A);  % 첫번째 요소는 m1, 두번째 요소는 k1에 넣는다
[m2,k2]=size(b);  % 첫번째 요소는 m2, 두번째 요소는 k2에 넣는다
x=zeros(m1,k2);

%상삼각 행렬로 만듬 대각행렬 아래를 0으로 만든다
for i=1:m1-1
    m=-A(i+1:m1,i)/A(i,i);
    A(i+1:m1,:)=A(i+1:m1,:)+m*A(i,:);
    b(i+1:m2,:)=b(i+1:m2,:)+m*b(i,:);
end
x(m1,:)=b(m1,:)./A(m1,m1);

%후치 대입법으로 근을 구함
for i=m1-1:-1:1
    x(i,:)=(b(i,:)-A(i,i+1:m1)*x(i+1:m1,:))./A(i,i);
end