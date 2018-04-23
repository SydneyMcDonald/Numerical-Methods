function[L,U,P] = luFactor(A)
%{
This function determines the LU Factorization of a square matrix using
partial pivoting
input variables:
A: a square coefficient matrix
output variables:
L: Lower triangular Matrix such that [L][U]=[A] which stores steps from gaussian elimination
U: Upper triangle matrix obtained from gaussian elimination on matrix A
P: Pivot Matrix that keeps track of the switching of rows
%}

%% check for errors and display error messages

if ismatrix(A) == 0 %checks if A is not a matrix
    error('input variable must be a matrix');
end

%% find size of matrix A and make sure it is square
MN = size(A);%this makes a matrix with MxN dimmensions for matrix A
if MN(1) == MN(2)
    n = MN(1); %store the square matrix size as a new variable to use for indexing 
else
    error('Matrix A must be a square matrix');
end

% initialize L, U, and P to match size of A
L = eye(n);
U = A;
P = eye(n);

%% perform pivoting and elimination
for col = 1:n
    % pivot matrix U so the greatest absolute value is in the pivotal point in the first column
    MAX = max(abs(U(col:n,col))); %find the max absolute value in the column in question
    for rowpiv = col:n
        rowmax = abs(U(rowpiv,col));%selects the potential pivot from each row upon iteration
        if MAX == 0 %if all of the values that could be in the pivot point are zero
            error('division by zero');
        elseif MAX == rowmax
            Urowp = U(col,:);%the row that needs to move from the pivot point
            Urows = U(rowpiv,:); %the row that needs to move to the pivot point
            Prowp = P(col,:); %corresponding P rows 
            Prows = P(rowpiv,:);
            %switch rows
            U(rowpiv,:) = Urowp;
            U(col,:) = Urows;
            P(rowpiv,:) = Prowp;
            P(col,:) = Prows;
            if col>1
                Lswitchp = L(col,1:col-1);
                Lswitchs = L(rowpiv,1:col-1);
                L(col,1:col-1) = Lswitchs;
                L(rowpiv,1:col-1) = Lswitchp;
            end
        end
    end
    
    % convert to upper triangle form using elimination
    for rowelim = col+1:n
        %find and store in L matrix the constants to multiply the row in
        %question by to eliminate the coefficients from the 
        
        L(rowelim,col) = U(rowelim,col)/U(col,col); 
        
        % subtract the first row times the constant stored in L from the
        % corresponding row and substitute into matrix U
        
        U(rowelim,:) = U(rowelim,:) - L(rowelim,col) * U(col,:);
        
        
    end
end
end