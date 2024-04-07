t = 0.5*%pi:0.01:5*%pi;

x1 = sin(t);
y1 = sin(2 * t);
z1 = t / 5;

// поворот в плоскости
param3d(x1, y1, z1, 80);
title('plot of the 1st system');
show_window(1);

x2 = cos(t);
y2 = cos(2 * t);
z2 = sin(t);
title('plot of the 2nd system');
//param3d(x2, y2, z2, 45, 15);
param3d(x2, y2, z2, 80);
