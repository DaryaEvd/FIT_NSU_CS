n = 5
T0 = 0.91
Ti = 5.5
K = 1.08

// Шаг дискретизации
h = Ti / 100

// По условию
T1 = 1.5

// Получение передаточной функции
s = poly(0, 's')
exp_decomp = 1 - T1*s + (T1*s)^2/2 - (T1*s)^3/6 + (T1*s)^4/24

Wright = exp_decomp / (1 + s * T0)^n
Wleft = K * (1 + (1 / (Ti * s))) * Wright
W = Wleft / (1 + Wleft)
//disp('Wleft = ', Wleft)
//disp('W = ', W)

// Создание линейной системы на основе передаточной функции
sys_lin = syslin('c', W)
// Преобразование непрерывной передаточной функции в дискретную форму с заданным временным шагом h (частота дискретизации системы)
// Получаем дискретную линейную модель передатчной функции W с временным шагом h
sys_discr = dscr(sys_lin, h)

// Нахождение данных, необходимых для уравнения Ляпунова
A_discr = sys_discr.A
E_discr = -eye(A_discr)
disp('A_discr = ', A_discr)
disp('E_discr = ', E_discr)

// Нахождение собственных чисел матрицы А
mat_A_spec = spec(A_discr)
disp('Спектр матрицы A_discr', mat_A_spec)

// Решение уравнения Ляпунова
// Флаг 'd' говорит о том, что система дискретная
H_discr = lyap(A_discr, E_discr, 'd')
disp('H_discr = ', H_discr)

// Нахождение собственных чисел матрицы - решения уравнения Ляпунова
mat_H_spec = spec(H_discr)
disp('Спектр матрицы H_discr', mat_H_spec)

if (mat_H_spec > 0) then
    disp('H положительно определена. По Th Ляпунова система устойчива асимптотически')
    // Получение коэффициента устойчивости
    kappa = norm(H_discr, 2)     
else
    kappa = %inf
end
disp('kappa(A_discr) = ', kappa)
