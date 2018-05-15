# Numerical-Methods
Repository containing codes made in Mech 105 class at CSU for numerical methods. 
The numerical methods in this repository include:
  -Simpson's 1/3 rule
  -LU factorization
  -False position
In this class we discussed a number of numerical methods for finding derivatives, integrals, position, and 
factors related to data collection and analysis. We used these codes in the context of systems of equations
representing physical systems to further our understanding of problem solving.

## Heun.m
This function uses a numerical method to approximate the solutions to first-order, ordinary differential equations and plot these 
approximations.

## Simpsons.m
This function is used to numerically estimate the integral of given "x" and "y" values for any given,
equally spaced data set using the simpson's 1/3 rule compounded over the amount of intervals. If there is
an odd number of intervals in a dataset, the trapezoidal rule will be applied to the last interval of the 
estimation.

## luFactor.m
This function is used to determine the Upper Triangle and Lower Triangle factorization of a square matrix 
using partial pivoting. This breaks down a matrix into simpler parts in order to solve systems of
equations. While this program does not solve the system, its outputs can easily be uses to do so

## falsePosition.m
This function is used to estimate the root of a function (where the function's dependent variable is equal to zero)
to a desired degree of certainty as dictated by a maximum approximate relative error. The function will iterate until either 
the error is bellow the desired error or once the set amount of iterations has been reached.
