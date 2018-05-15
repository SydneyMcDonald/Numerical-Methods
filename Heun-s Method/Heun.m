function[t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%{
This is a general function for solving ordinary differential equations
using Heun's method with iteration.

inputs:
dydt - the differential equation dy/dt = f(t,y) (EX: dydt = @(t,y) t^2 - 3*y)
tspan - the interval of t [firstvalue,lastvalue] over which the equation should be solved
y0 - initial condition (what y is equal to when t=firstvalue)
h - desired step size
es - percent error stopping criterion (default = 0.001)
maxit - interation stopping criterion (default = 50)

Outputs:
t - the values at which the function is evaluated
y - the solution points at the times t
%}

%error messages
if nargin<4
    error('user must input at least dydt, tspan, y0, and h');
end
if tspan(1)>=tspan(2)
    error('the span of t must be increasing from tinitial to tfinal');
end
%defaults
if nargin < 5 || isempty(es) == 1 %no error bound
    es = 0.001;
end
if nargin < 6 || isempty(maxit) == 1 %no iterations
    maxit = 200;
end

%find a vector storing all t values for the span with the increasing step
%size h
n = 1;
ts(1,1) = tspan(1,1);
while ts(1,n)+h < tspan(1,2)
    ts(1,n+1) = ts(1,n)+h;
    n=n+1;
end
if ts(end)~=tspan(1,2)
   ts(n+1) = tspan(1,2);
end
 
%find length of ts vector
 tL = length(ts);
%initialize y vector to hold same number of values as ts vector
 y = zeros(1,tL);
%set the initial y value to the input initial y value
 y(1) = y0;
 
 
 % heun's method
 for i = 1:tL-1    
    ea = 100;
    iter = 0;
    h = ts(i+1)-ts(i);
    % calculate left slope f(ti,yi)
    Lm = dydt(ts(i),y(i));
    % Euler's method to make a prediction
    y(i+1) = y(i) + h*Lm;
    while ea>es && iter<maxit
        % save guess
        yguessold = y(i+1);
        % calculate right slope f(ti+1,yi+1) off of prediction
        Rm = dydt(ts(i+1),y(i+1));
        % calculate ideal slope by averaging left and right slopes
        m = (Lm+Rm)/2;
        % calculate new yi+1 estimate using ideal slope
        y(i+1) = y(i)+h*m;
        % calculate approximate error and check whether it should iterate again
        ea = abs((y(i+1)-yguessold)/y(i+1))*100;
        % add completed iteration
        iter = iter+1;
    end
 end
 t=ts; % change the variable so it outputs correctly
 
 %plot the t and y values that are calculated using heun's method
 plot(t,y);
 title('Heun Plot');
 xlabel('t');
 ylabel('y');
end