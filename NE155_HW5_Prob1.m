%NE 155 - Introduction to Numerical Methods in Radiation Transport
%Homework 5
%Problem 1)

clc, clear, clf

N = 100; 

%Part a)
A = full(gallery('tridiag',N,-1,2,-1));
b = zeros(N,1);

for i = 1:N
    
    b(i) = i - 1;
    
end

%Part b)
%Condition number of A
condA = cond(A);

%Part c)
%Solving Ax = b by inverting A
x_exp = inv(A)*b;

%Part d)
%Solving Ax = b using backslash operator
x_back = A\b;

hold on
plot(x_exp,'k-')
plot(x_back,'ro')

xlabel('Unknown Equations')
ylabel('Solution')
title('Comparison of Explicit Matrix Iversion and Matrix Backslash Operator')
legend('Explicit Inversion','Backslash Operator','Location','Best')