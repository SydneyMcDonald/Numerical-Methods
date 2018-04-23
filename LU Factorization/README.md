## LU Factorization
This function is used to determine the Upper Triangle and Lower Triangle factorization of a square matrix using partial pivoting. This 
breaks down a matrix into simpler parts in order to solve systems of equations. While this program does not solve the system, its outputs 
can easily be uses to do so.

## Inputs
* ```A``` - A square matrix (the coefficient matrix of a system of equasions such as ```[A]{x}={b}```)

## Outputs
* ```U``` - A square Upper Triangular matrix found by performing Gaussian Elimination on matrix ```A```

* ```L``` - A square lower Triangular matrix shuch that ```[L][U]=[P][A]``` where ```P``` is the pivot matrix

* ```P``` - A square pivot matrix found by switching rows of an identity matrix corresponding to row switches performed on U

## Method
Gaussian Elimination with pivoting eliminates variables from the coefficient matrix so that the matrix is in upper triangular form
with only zero entries bellow the diagonal. Operations in this method include switching rows so that the greatest value of the first 
nonzero column is in the pivot point, and subtracting a multiple of the row of that pivot point from the other rows so that all values in 
the column below the pivot point are equal to zero. The multiples for these row operations are stored in corresponding 
coordinates in the matrix ```L``` and the row switches are kept track of by switching the same rows of the matrix ```P```.
The results of these calculations provide that ```[L][U]=[P][A]```. This function leaves the matrix ```A``` 
unchanged so that this can be verified.

## Limitations
This method only works on square matrices. This method will not work in cases of division by zero. Division by zero will occur if the 
greatest value in a column below and including a pivot point is equal to zero, while the values in the columns before, bellow the pivot 
points have been cancelled out.
