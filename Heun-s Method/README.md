## Heun's Method
This function uses a numerical method to approximate the solutions to differential equations and plot
these approximations.

## Inputs
* ```dydt``` - a first order, ordinary differential equation. ie. ```dydt = @(t,y) t^2 + 18*y;```

* ```tspan``` - the lower bound of an interval in whicthe interval of t [firstvalue,lastvalue] over which the equation should be solvedh the root of the function resides

* ```y0``` - initial condition (what y is equal to when t=firstvalue)

* ```h``` - the desired step size

* ```es``` - the desired maximum error (default is set to 0.001%)

* ```maxit``` - the maximum number of iterations (default is set to 50 iterations)

## Outputs
* ```t``` - the values at which the function is evaluated (independent variable)

* ```y``` - the solution values at corresponding t values (dependent variable)

## Method
This function estimates the solution to a differential equation by using Euler's method: estimating the value of y at t 
using the equation ```y(i+1) = y(i) + h*dydt(t(i),y(i))```. Then the slope at y(i) and y(i+1) are averaged
and used to make a better estimate of y(i+1). Iterations of this correction bring the approximated value closer
to the solution value. Once this approximation either reaches the maximum number of iterations or falls below 
the desired approximate error, the function will use the same method with y(i+1) to approximate y(i+2) and so on.

When the t values are unevenly spaced in tspan (the last interval is smaller than the rest), this function will still work, estimation the value of 
y at each value of t.

## Limitations
Currently, a roundoff error leads to the last value of the t interval being repeated in only some of the cases when intervals are evenly spaced. 
This error does not effect the solution, as it is a repetition, but should be adressed when performing further
computations using this data.
