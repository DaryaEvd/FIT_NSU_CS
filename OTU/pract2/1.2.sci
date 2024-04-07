A = [
        4 5 -2;
        3 -1 0;
        4 2 7;
    ];
    
B = [
        2 1 -1;
        0 1 3;
        5 7 3;
    ];
    
printf("A: ");
disp(A);
printf("\n");

printf("B: ");
disp(B);
printf("\n");

D = 3 * A^2 - (A + 2*B) * B;

printf("D: ");
disp(D);
printf("\n");

D_pow_minus_one = D ^ (-1);
printf("D ^ (-1): ");
disp(D_pow_minus_one);
printf("\n");

// проверяем, что матрица невырожденная
det_D = det(D);
printf("det_D: ");
disp(det_D);
printf("\n");

// лучше использовать эту функцию
// для нахождения обратной матрицы
inv_D = inv(D);
printf("inv_D: ");
disp(inv_D);
printf("\n");

E = D * D_inv;
printf("D * D ^ (-1): ");
disp(E);
printf("\n");
