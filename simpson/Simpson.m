function[I] = Simpson(x,y)
%{
This fuction takes the input of the x and y values of a given function and
and returns the integral (I) of the dataset.
x - a vector of evenly spaced intervals
y - a vector with the same size as x containing datapoints (f(x))
I - the numerical integral of the x and y values computed using the
Simpson's 1/3 rule unless there is an odd number of intervals, in which
case the trapezoidal rule will be applied to the last interval.
%}

%check inputs are the same length    
if length(x) ~= length (y)
    error('x and y vectors must be the same length')
end

%check x is equally spaced
if diff(x) ~= diff(linspace(x(1,1),x(1,end),length(x)))
    error('x is not equally spaced');
end
    
%innitialize integral variable
I=0;

%find I integral using simpsons 1/3 rule compoinded over all intervals and trapezoidal rule if needed    
for u = 1:2:length(x)
    if length(x)-u >= 2 %there are enough datapoints left to do simpsons 1/3 rule
        x1 = x(u);
        x2 = x(u+1);
        x3 = x(u+2);
        y1 = y(u);
        y2 = y(u+1);
        y3 = y(u+2);
    %simpson's 1/3 rule
        I = I+(x3-x1)*(y1+4*y2+y3)/6;
    
    elseif length(x)-u == 1 %not enough terms left for 1/3 rule
        warning('the trapezoidal rule was implemented on the last term');
        a = x(length(x)-1);
        b = x(length(x));
        ya = y(length(x)-1);
        yb = y(length(x));
    %trapezoidal rule
        I = I + (b-a)/2*(ya+yb);
    end
end
