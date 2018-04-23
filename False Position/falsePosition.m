function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%{
Before using code user must write code 
x = sym('x');
f(x) = desired mathematical function ie x^2-3
input just "f" to the func position when using the function
for cleaner output place a semicolon at the end of the function call
estimates the root of a given function using the false position method
inputs:
func - the function being evaluated
xl - the lower guess
xu - the upper guess
es - the desired relative error (default 0.0001%)
iter - the number of iterations desired (defult 200)
outputs:
root - the estimated root location
fx - the function evaluated at the root location
ea - the approximate relative error (%)
iter - how many iterations were performed
%}

%% initializing variables
root = 0;
ea =100;
iter = 0;
rootold = 0;

%% assigning empty optional input variables
if nargin < 3 %not enough arguments
    error ('You must enter the function, lower guess, and upper guess');
end
if func(xl)*func(xu)>=0 %no root in bracket
    error('upper and lower values do not bracket the root');
end
if nargin < 4 || isempty(es) == 1 %no error bound
    es = 0.0001;
end
if nargin < 5 || isempty(maxiter) == 1 %no iterations
    maxiter = 200;
end

%% false positioning iterations
while abs(ea)>abs(es) && iter<maxiter
   
    %keep previous root guess value after first iteration
    if iter>=1
        rootold = root;
    end
    
    %false position to find next root guess
    root = xu - (func(xu)*(xu-xl))/(func(xu)-func(xl));
    
    %check sign changes for new brackets 
    if func(xl)*func(root)<0
        xu = root;
    elseif func(root)*func(xu)<0
        xl = root;
    else
        error ('no sign change')
    end
    
    %error after first iteration
    if iter>=1
    ea = abs((root-rootold)/root)*100;
    end
    
    %iteration
    iter=iter+1;%first time: at the end of this while loop 1 iteration has been completed
end

%% function at final root guess
fx = func(root);

%% display results
fprintf('root: %.8f \n function at root: %.8f \n approximate error: %.8f%% \n itterations: %.0f \n',double(root),double(fx),double(ea),double(iter));

end