x = -200:0.1:200;
for i = 1:length(x)
    y = ((2 * x.^2) - 5) ./ sqrt(x.^2 - 2);   
end

plot(x, y);
disp(x);
