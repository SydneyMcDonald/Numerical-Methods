## False Position
This function is used to estimate the root of a function (where the function's dependent variable is equal to zero) to a desired degree 
of certainty as dictated by a maximum approximate relative error. The function will iterate until either the error is bellow the desired 
error or once the set amount of iterations has been reached.

## Inputs
* ```func``` - a mathematical function formatted so that the variable can be plugged into using matlab,
ie. ```f = @(x) x^2 + 18*x;```

* ```xl``` - the lower bound of an interval in which the root of the function resides

* ```xu``` - the upper bound of an interval in which the root of the function resides

* ```es``` - the desired maximum error (default is set to 0.0001%)

* ```maxiter``` - the maximum number of iterations (default is set to 200 iterations)

## Outputs
* ```root``` - the location at which the function is equal to zero within a certain error

* ```fx``` - the function evaluated at the root (this should be approximately zero)

* ```ea``` - the approximate error of the root guess

* ```iter``` - the number of iterations that led to this root guess

## Method
This function makes a root approximation by implementing iterations of the equation:

```root = xu - func(xu) * (xu-xl)/(func(xu)-func(xl))```

After each iteration the root estimate replaces one of the bounds of the interval such that the root is still bracketed by the new 
variable. In other words, there must be a sign change between the new bracket and the kept, old bracket.

Approximate error is found by the equation:

```ea = |(rn-ro)/rn|*100%```

Where rn is the new root guess and ro is the old root guess from the previous iteration.

## Limitations
The initial ```xl``` and ```xu``` values must bracket the root or the program will not work. At least ```func```, ```xl```, and ```xu``` 
must be input into the program or it cannot run. However, there are default values for ```ea``` and ```maxiter``` so those do not need 
to be input. This function is unable to find roots where the function does not switch signs (ie the parabola y = x^2).
