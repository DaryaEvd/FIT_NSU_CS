n = 5
T0 = 0.91
Ti = 4.05
K = 1.35
T1 = 0

Td = Ti / 4
Tс = Td / 8

s = poly(0, 's')

Wright = 1 / (1 + s * T0)^n
Wleft = K * (1 + (1 / (Ti * s)) + ((Td * s)/(Tс * s + 1))) * Wright
W = Wleft / (1 + Wleft)
//disp('Wleft = ', Wleft)
//disp('W = ', W)

sys_lin = syslin('c', W)
[A, B, C, D] = abcd(sys_lin)
disp('A = ', A)
disp('B = ', B)
disp('C = ', C)
disp('D = ', D)

mat_A_spec = spec(A)
disp('Спектр матрицы A', mat_A_spec)

H = lyap(A, -eye(A), 'c')
disp('H = ', H)

mat_H_spec = spec(H)
disp('Спектр матрицы Н', mat_H_spec)

if (mat_H_spec > 0) then
    disp('H положительно определена. По Th Ляпунова система устойчива асимптотически')
    kappa = norm(H, 2)     
else
    kappa = %inf
end
disp('kappa(A) = ', kappa)
