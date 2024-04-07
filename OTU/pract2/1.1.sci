A = [
        1 2 3 4;
        2 1 2 3;
        3 2 1 2; 
        4 3 2 1;
    ];

b = -[5; 1; 1; -5];

x = linsolve(A, b);
printf("x: ")
disp(x);
printf("\n");
 
b_check = A * x;
 
printf("A * x: ");
disp(b_check);
