u = linspace(0, 2*%pi)
v = linspace(0, 4*%pi)

x = (cos(u).*u)'*(1+cos(v/2));
y = (u/2)'*sin(v);
z = (sin(u).*u)'*(1+cos(v/2));

plot3d2(x, y, z);
