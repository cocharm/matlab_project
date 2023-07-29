function [x,rel_error] = Jacobi(A,b,threshold)
[m,n]=size(A);
maxitn=30;
C=A;
for i=1:n
    C(i,i)=0;
    x(i)=0;
end
x=x';
for i=1:n
    C(i,:)=C(i,:)/A(i,i);
    d(i)=b(i)/A(i,i);
end
itn=0;
while(1)
    xold=x;
    for i=1:n
        x(i)=d(i)-C(i,:)*xold; % x(i)=d(i)-C(i,:)*x << Gauss-seidel 차이점은 이거 하나!!!
        if (i)~=0
            rel_error(i)=abs((x(i)-xold(i))/x(i))*100;
        end
    end
    itn=itn+1;
    fprintf('%d회 반복:x(1.....%d x : \n',itn,n);
    disp(x);
    fprintf('상대오차 rel_error(1...%d: \n',n);
    disp(rel_error);
    fprintf('----------------------------------------------\n');
    if max(rel_error) <= threshold || itn >= maxitn
        break;
    end
end
end