// задаем все необходимые параметры
n = 5;
T0 = 0.91;
K = 1.08;
Ti = 5.5
T1 = 0; // ==> exp(-s*T1) = 1 
coef = 1; // этот параметр равен 1, 2, 10, 100 - по заданию
h = 1/coef; // шаг временной сетки

s = poly(0, 's'); // задаём полином
Wright = 1 /(1 + s*T0)^n;
Wleft =(1 + 1/(s * Ti)) * K * Wright;
W = Wleft / (1 + Wleft); // передаточная функция всей системы

// создание записи непрерывной системы
sl = syslin('c', W); // 'c' - for character string
sysD = dscr(sl, h); // h - sampling period (период дискретизации) 

// здесь сетка, на кт будем сроить решение
time_max = 100;  
t = [0:h:time_max];

//Если x является списком syslin (линейная система в виде пространства состояний или передаточной форме), то zeros(x) так же является корректным и возвращает матрицу нулей.

v = zeros(sysD.B); // создаем матрицу, состоящую из нулей (того же размера, что и sysD.B)
u = ones(t); // создаем матрицу, состоящую из единиц
x = zeros(u);

// дискретная система в нормальной форме 1го порядка
for i=1:length(u)
    v = sysD.A * v + sysD.B;
    x(i) = sysD.C * v;
end
// переходная характеристика системы по дискретной модели
plot(t, x,'black');

data = fscanfMat("D:\ОТУ2024\pract4_1\PI-reg.TNO");
// переходная характеристика системы из микрокапа
plot(data(:, 1), data(:, 2), 'red'); 

// считаем ошибку
y = data(:,2);
err = 0;
tau = h * 100;
for k = 2:length(t) 
	err = err + (y((k-1)*tau) - x(k))^2;
end
err = sqrt(err/length(t));
disp(err);