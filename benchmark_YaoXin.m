function f=benchmark_YaoXin(x,func_num)
 
% benchmark_YaoXin.m is the main function for 23 test functions, all minimize
% problems
% e.g. f=benchmark_func(x,func_num)
% x is the variable, f is the function value 
% func_num is the function num,

% Functions	Name
% f01	Sphere model
% f02	Schwefel¡¯s problem 2.22
% f03	Schwefel¡¯s problem 1.2
% f04	Schwefel¡¯s problem 2.21
% f05	Generalized Rosenbrock¡¯s functions
% f06	Step function
% f07	Quartic function
% f08	Generalized Schwefel¡¯s problem 2.26
% f09	Generalized Rastrigin¡¯s function
% f10	Ackley¡¯s function
% f11	Generalized Griewank function
% f12	Generalized Penalized function 1
% f13	Generalized Penalized function 2
% f14	Shekel¡¯s Foxholes function
% f15	Kowalik¡¯s function
% f16	Six-Hump Camel-Back function
% f17	Branin Function
% f18	Glodstein-Price function
% f19	Hartman¡¯s function 1
% f20	Hartman¡¯s function 2
% f21	Shekel¡¯s Function 1
% f22	Shekel¡¯s Function 2
% f23	Shekel¡¯s Function 3 
 
%Chen Xu  2014.Nov.15

if func_num==1  % Sphere model
    [ps,D]=size(x); 
    f=sum(x.^2,2);
end

if func_num==2  % Schwefel¡¯s problem 2.22
    [ps,D]=size(x);
    f=sum(abs(x),2)+prod(abs(x),2); 
end

if func_num==3  % Schwefel¡¯s problem 1.2
    [ps,D]=size(x);
    for k=1:ps
        temp=cumsum(x(k,:));
        temp=temp.^2;
        f(k,:)=sum(temp); 
    end
end

if func_num==4  % Schwefel¡¯s problem 2.21
    [ps,D]=size(x);
    for k=1:ps
        temp=abs(x(k,:));
        f(k,:)=max(temp); 
    end
end

if func_num==5  % Generalized Rosenbrock¡¯s functions
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        for i=1:D-1
            f(k,:)=f(k,:)+100*(x(k,i+1)-x(k,i)^2)^2+(1-x(k,i))^2; 
        end
    end
end

if func_num==6  % Step Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        temp = floor(x+0.5);
        f=sum(temp.^2,2);
    end
end

if func_num==7  % Quartic Function i.e. Niose
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        for i=1:D
            f(k,:)=f(k,:)+i*x(k,i)^4; 
        end
        f(k,:)=f(k,:)+rand;
    end
end

if func_num==8  % Generalized Schwefel's Problem 2.26
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        for i=1:D
            f(k,:)=f(k,:)-x(k,i)*sin(sqrt(abs(x(k,i)))); 
        end
    end
end

if func_num==9  % Generalized Rastrigin's Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        for i=1:D
            f(k,:)=f(k,:)+x(k,i)^2-10*cos(2*pi*x(k,i))+10; 
        end
    end
end

if func_num==10  % Ackley's Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        temp1=(sum(x(k,:).^2))/D;
        temp1=-20*exp(-0.2*sqrt(temp1));
        temp2=sum(cos(2*pi*x(k,:)))/D;
        temp2=-exp(temp2); 
        f(k,:)=f(k,:)+temp1+20+temp2+exp(1); 
    end
end

if func_num==11  % Generalized Griewank Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=sum(x(k,:).^2)/4000-prod(cos(x(k,:)./(sqrt([1:D]))))+1; 
    end
end

if func_num==12  % Generalized Penalized Function 1
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        y(k,:)=1+(x(k,:)+1)./4;
        temp1=0;
        for i=1:D-1
            temp1=temp1+(y(k,i)-1)^2*(1+10*(sin(pi*y(k,i+1)))^2);
        end
        temp1=temp1+10*(sin(pi*y(k,1)))^2+(y(k,D)-1)^2;
        temp1=temp1*pi/D;
        temp2=0;
        for i=1:D
            temp2=temp2+u12(x(k,i),10,100,4);
        end
        f(k,:)=f(k,:)+temp1+temp2;
    end
end

if func_num==13  % Generalized Penalized Function 2
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=0;
        temp1=0;
        for i=1:D-1
            temp1=temp1+(x(k,i)-1)^2*(1+(sin(3*pi*x(k,i+1)))^2);
        end
        temp1=temp1+(sin(3*pi*x(k,1)))^2+(x(k,D)-1)^2;
        temp1=temp1*0.1;
        temp2=0;
        for i=1:D
            temp2=temp2+u12(x(k,i),5,100,4);
        end
        f(k,:)=f(k,:)+temp1+temp2;
    end
end

if func_num==14  % Shekel¡¯s Foxholes Function
    [ps,D]=size(x);
    a=[-32  16   0   16  32 -32 -16  0   16  32 -32 -16 0 16 32 -32 -16 0  16 32 -32 -16 0  16 32;
       -32 -32  -32 -32 -32 -16 -16 -16 -16 -16  0   0  0 0  0   16  16 16 16 16  32  32 32 32 32]; 
    for k=1:ps
        temp=0;
        for j=1:25
            temp1=0;
            for i=1:2
                temp1=temp1+(x(k,i)-a(i,j))^6;
            end
            temp=temp+1/(temp1+j);
        end
        f(k,:)= (1/500+temp)^(-1); 
    end
end

if func_num==15  % Kowalik's Function
    [ps,D]=size(x);
    a=[0.1957 0.1947 0.1735 0.1600 0.0844 0.0627 0.0456 0.0342 0.0323 0.0235 0.0246];
    b=[0.25   0.5    1      2      4      6      8      10     12     14     16].^(-1);
    for k=1:ps
        f(k,:)=0;
        for i=1:11 
            f(k,:)=f(k,:)+(a(i)-x(k,1)*(b(i)^2+b(i)*x(k,2))/(b(i)^2+b(i)*x(k,3)+x(k,4)))^2;    
        end
    end
end

if func_num==16  % Six-Hump Camel-Back Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=4*x(k,1)^2-2.1*x(k,1)^4+x(k,1)^6/3+x(k,1)*x(k,2)-4*x(k,2)^2+4*x(k,2)^4; 
    end
end

if func_num==17  % Branin Function
    [ps,D]=size(x);
    for k=1:ps
        f(k,:)=(x(k,2)-5.1/(4*pi*pi)*x(k,1)^2+5/pi*x(k,1)-6)^2+10*(1-1/(8*pi))*cos(x(k,1))+10 ; 
    end
end

if func_num==18  % Goldstein-Price Function
    [ps,D]=size(x);
    for k=1:ps
        temp1=1+(x(k,1)+x(k,2)+1)^2*(19-14*x(k,1)+3*x(k,1)^2-14*x(k,2)+6*x(k,1)*x(k,2)+3*x(k,2)^2);
        temp2=30+(2*x(k,1)-3*x(k,2))^2*(18-32*x(k,1)+12*x(k,1)^2+48*x(k,2)-36*x(k,1)*x(k,2)+27*x(k,2)^2);
        f(k,:)=temp1*temp2;
    end
end

if func_num==19  % Hartman's Function
    [ps,D]=size(x);
    a=[ 3   10 30;
        0.1 10 35;
        3   10 30;
        0.1 10 35 ];
    p=[ 0.3689  0.1170  0.2673;
        0.4699  0.4387  0.7470;
        0.1090  0.8732  0.5547;
        0.03815 0.5743  0.8828];
    c=[1 1.2 3 3.2];
    for k=1:ps
        f(k,:)=0;
        for i=1:4
            f(k,:)=f(k,:)-c(i)*exp(-a(i,1)*(x(k,1)-p(i,1))^2-a(i,2)*(x(k,2)-p(i,2))^2-a(i,3)*(x(k,3)-p(i,3))^2);
        end 
    end
end

if func_num==20  % Hartman's Function
    [ps,D]=size(x);
    a=[ 10    3    17   3.5  1.7  8;
        0.05  10   17   0.1  8    14;
        3     3.5  1.7  10   17   8;
        17    8    0.05 10   0.1  14];
    p=[ 0.1312  0.1696  0.5569  0.0124  0.8283  0.5886;
        0.2329  0.4135  0.8307  0.3736  0.1004  0.9991;
        0.2348  0.1415  0.3522  0.2883  0.3047  0.6650;
        0.4047  0.8828  0.8732  0.5743  0.1091  0.0381];
    c=[1 1.2 3 3.2];
    for k=1:ps
        f(k,:)=0;
        for i=1:4
            f(k,:)=f(k,:)-c(i)*exp(-a(i,1)*(x(k,1)-p(i,1))^2-a(i,2)*(x(k,2)-p(i,2))^2-a(i,3)*(x(k,3)-p(i,3))^2-a(i,4)*(x(k,4)-p(i,4))^2-a(i,5)*(x(k,5)-p(i,5))^2-a(i,6)*(x(k,6)-p(i,6))^2);
        end 
    end
end

if func_num==21 | func_num==22 | func_num==23   % Shekel¡¯s Function 1 2 3
    [ps,D]=size(x);
    a=[ 4  4  4  4;
        1  1  1  1;
        8  8  8  8;
        6  6  6  6;
        3  7  3  7;
        2  9  2  9;
        5  5  3  3;
        8  1  8  1;
        6  2  6  2;
        7  3.6 7 3.6];
    c=[0.1 0.2 0.2 0.4 0.4 0.6 0.3 0.7 0.5 0.5];
    
    if func_num==21
        for k=1:ps
            f(k,:)=0;
            for i=1:5
               f(k,:)=f(k,:)-((x(k,:)-a(i,:))*(x(k,:)-a(i,:))'+c(i))^(-1); 
            end
        end 
    end 
    if func_num==22
        for k=1:ps
            f(k,:)=0;
            for i=1:7
               f(k,:)=f(k,:)-((x(k,:)-a(i,:))*(x(k,:)-a(i,:))'+c(i))^(-1); 
            end
        end 
    end
    if func_num==23
        for k=1:ps
            f(k,:)=0;
            for i=1:10
               f(k,:)=f(k,:)-((x(k,:)-a(i,:))*(x(k,:)-a(i,:))'+c(i))^(-1); 
            end
        end 
    end
    
    end
    
end


 
function u=u12(x,a,k,m)
% ÓÃÓÚf12: Generalized Penalized Function
if x>a
    u=k*(x-a)^m; 
elseif x>=-a & x<=a
    u=0;
elseif x<a
    u=k*(-x-a)^m;
end  
end

 
 
 