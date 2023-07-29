function res = Taylor_Series_sin(f,eps_s)

%사인 함수를 테일러 급수로
%f=sin(pi/4); %구하고 싶은 함수, 참값
x=1;
j=0;
%n=3; %유효숫자 갯수
%eps_s=0.5*10^(2-n); 상대오차
known=1;
%unknown=pi/4; %근사값
unknown=f;
func=0; % 테일러 함수 func 초기화
func_before=0; % 이전 테일러 함수 func_before 초기화
%fprintf('terms\t\t근사오차\t\t\t\t상대오차\t\t\t\t함수값\n');
while j<100 %초항 0부터 100항까지 반복
    if mod(j,4) == 0
        plusfunc = sin(x);
    elseif mod(j,4) == 1
        plusfunc = cos(x);
    elseif mod(j,4) == 2
        plusfunc = -sin(x);
    else
        plusfunc = -cos(x);
    end
    func=func+plusfunc/factorial(j)*((unknown-known)^j); %테일러 급수 전개
    eps_a = (func-func_before)/func*100; %근사오차 = (현재값-이전값)/현재값
    %eps_t = (f-func)/f*100; %상대오차 = (참값-현재값)/참값
    %fprintf('%2.0f\t\t\t%2.7f\t\t\t%2.7f\t\t\t%2.7f\n',j,eps_a,eps_t,func);
    
    if abs(eps_a) < eps_s
        break;
    end
    func_before=func;
    j=j+1;
end
%fprintf('\n실제값 : %2.10f\n',f);
fprintf('근사값 : %2.10f\n',func);

res=func;
end