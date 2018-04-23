## Simpson's 1/3 method
This function is used to numerically estimate the integral of given "x" and "y" values for any given, equally spaced data set using the 
simpson's 1/3 rule compounded over the amount of intervals. If there is an odd number of intervals in a dataset, the trapezoidal rule will 
be applied to the last interval of the estimation.

## Inputs
* ```X``` - a vector of equally spaced values relating to the independent variable

* ```y``` - a vector the same length as ```x``` containing values relating to each respective value in ```x``` ie. y = f(```x```) where f is some function.

## Outputs
* ```I``` - The numerical estimation for the integral of the dataset 

## Method
The numerical estimation for integration is found by the compounding of the Simpson's 1/3 equation:

```I= h*(f(x1)+4f(x2)+f(x3))/6```

where h is the length of one interval (the difference between two consecutive x values), and f(xi) are consecutive y values

If there are an odd number of intervals between data points, the last interval will be calculated using trapezoidal rule:

```I = h*(f(x1)+f(x2))/2```

where h is the length of one interval (the difference between two consecutive x values), and f(xi) are consecutive y values

## Limitations
It should be noted that this code was written for use on a dataset with equally spaced values of the independent variable vector. If this condition is not met, the code will not run. It should also be noted that the two input methods must be the same thength for the code to run
