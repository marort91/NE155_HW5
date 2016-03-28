%NE 155 - Introduction to Numerical Methods in Radiation Transport
%Homework 5
%Problem 5b)

clc, clear

%Experiment determination of optimal omega for SOR

N = 5;
A = MatrixGenProb4(N);
b = 100.*ones(N,1);

%Minimization of number of iterations to achieve an absolute error
%tolerance of 1e-8

tol = 1e-8;

%omega in range (0,2)

omega = 0.01:0.01:1.99;

iterations = zeros(1,length(omega));

for i = 1:length(omega)
    
    [x,iter] = SORSolve(A,b,10000,tol,omega(i),'absolute');
    iterations(i) = iter;
    
end

wopt = omega( find(iterations == min(iterations)) );
plot(omega,iterations)
xlabel('\omega','FontSize',24)
ylabel('Iterations')
title('Optimal SOR Parameter Search')
axis([0.8 1.2 0 100])