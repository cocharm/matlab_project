function res=doolittle_lu(A,b)
%A = input ('square matrix A = ');
%B = input ('상수행렬 b = ');
[n,m]=size(A);
if(n~=m)
    error('it is not sqare matrix.');
end
if size(b,2)>1
    b=b';
end
[n1,m1]=size(b);

L=eye(n);
U=zeros(n,n);

for k=1:n
    U(k,k)=A(k,k)-L(k,1:k-1)*U(1:k-1,k);
    for j=k+1:n
        U(k,j)=A(k,j)-L(k,1:k-1)*U(1:k-1,j);
        L(j,k)=(A(j,k)-L(j,1:k-1)*U(1:k-1,k))/U(k,k);
    end
end
disp(' matrix A');
disp(A);
disp(' matrix L');
disp(L);
disp(' matrix U');
disp(U);

B=L*U;
disp(' matrix B = L*U');
disp(B);

%Ly = b 에서 y 구하기
y=zeros(n,1);
for j=1:m1
    y(1,j)=b(1,j)/L(j,j);
    for i=2:n
        y(i,j)=(b(i,j)-L(i,1:i-1)*y(1:i-1,j))./L(i,i);
    end
end
disp('매개변수 y의 근');
fprintf('y1= %.4f   y2= %.4f   y3= %.4f   y4= %.4f \n',y);
fprintf('\n');

%Ux=y에서 x구하기
x=zeros(n,1);
for j=1:m1
    x(n,j)=y(n,j)/U(n,n);
    for i=n-1:-1:1
        x(i,j)=(y(i,j)-U(i,i+1:n)*x(i+1:n,j))./U(i,i);
    end
end

disp('방정식의 근 x');
fprintf('x1= %.6f   x2= %.6f   x3= %.6f   x4= %.6f \n',x);
fprintf('\n');
end