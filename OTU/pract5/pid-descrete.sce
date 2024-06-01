T0 = 0.91
n = 5
Ti = 8
K = 1.125
Td = Ti / 4
Tc = Td / 8
T1 = 1.5

h = Ti / 100

s = poly(0, 's')
exp_decomp = 1 - T1*s + (T1*s)^2/2 - (T1*s)^3/6 + (T1*s)^4/24

Wright = exp_decomp / (1 + s * T0)^n
Wleft = K * (1 + (1 / (Ti * s)) + ((Td * s)/(Tc * s + 1))) * Wright
W = Wleft / (1 + Wleft)
//disp('Wleft = ', Wleft)
//disp('W = ', W)

sys_lin = syslin('c', W)
sys_discr = dscr(sys_lin, h)

A_discr = sys_discr.A
E_discr = -eye(A_discr)
disp('A_discr = ', A_discr)
disp('E_discr = ', E_discr)

mat_A_spec = spec(A_discr)
disp('Спектр матрицы A_discr', mat_A_spec)

H_discr = lyap(A_discr, E_discr, 'd')
disp('H_discr = ', H_discr)

mat_H_spec = spec(H_discr)
disp('Спектр матрицы H_discr', mat_H_spec)

if (mat_H_spec > 0) then
    disp('H положительно определена. По Th Ляпунова система устойчива асимптотически')
    kappa = norm(H_discr, 2)     
else
    kappa = %inf
end
disp('kappa(A_discr) = ', kappa)
