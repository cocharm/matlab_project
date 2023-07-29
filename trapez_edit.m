function trapez_edit(f,a,b,n) % 입력함수 f  범위[a,b]  범위를 나누는 구간=n 

h=(b-a)/n;
disp('-----------------------------------------------------------------')
disp(['           i           xi           f(xi)         h=',num2str(h)])
disp('-----------------------------------------------------------------')

S=feval(f,a);
fprintf('%2.0f%12.4f%14.6f\n',0,a,S);
for i=1:n-1
    x=a+h*i;
    g=feval(f,x);
    S=S+2*g;
    fprintf('%2.0f%12.4f%14.6f\n',i,x,g);
end

S=S+feval(f,b);
fprintf('%2.0f%12.4f%14.6f\n',n,b,feval(f,b));
INT=h*S/2;
fprintf('\n    The intergral of f(x) is =%16.8f\n',INT);
end