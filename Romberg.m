function rel = Romberg(y,x1,x2)
%y : 입력 데이터 벡터
%a,b : 적분 구간

n = length(y);
a=zeros(4,4);
h=x2-x1;
for i=1:4
    sum = y(1)+y(n);
    h = (x2-x1)/2^(i-1);
    if i==1
        a(i,1) = h/2*sum;
    else
        for k=1:2^(i-1)-1                %일반식 들어갈 자리
            sum=sum+2*y((k*(h*10))+1);   %일반식 들어갈 자리 
        end                              %일반식 들어갈 자리 
        a(i,1)=h/2*sum;                  %일반식 들어갈 자리
    end
end
for c=2:4
    for d=2:4
        a(d,c)=(4^(c-1)*a(d,c-1)-a(d-1,c-1))/(4^(c-1)-1);
    end
end
rel=a(c,d);
end

% 이상한 코드 / 책 참고 할 것