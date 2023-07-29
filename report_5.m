clear;
close;
count=0; 
maxcount=10; 
ko=100; 
f1=@(x) -(x^3-4*x^2-8)/2; 

a=input('초기값입력 a=');
b=input('오차 입력 b=');

t=(a-1:1/10:a+2)';
yt=zeros(size(t));
for n=1:length(t)
    yt(n)=f1(t(n));
end

plot(t,t);
hold on
plot(t,yt);
grid on;
hold off
disp('count a(근) k(오차)')

while(1)
    x=f1(a);
    k=abs((x-a)/x)*100; 
    a=x;
    if( b>k || count >maxcount)
        break;
    end
    fprintf('%4d %.4f %.5f\n',count,a,k);
    count=count+1;
end
num=a;
if (count>maxcount)
    disp('맥스 카운터를 초과함');
else
    fprintf('횟수:%d 값:%.4f\n',count,num);
end