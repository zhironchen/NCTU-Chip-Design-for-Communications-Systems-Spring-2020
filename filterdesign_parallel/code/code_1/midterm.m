randn('seed',123)
x(1:524) = 0;
x_temp = randn(1, 512);
x(13:524) = x_temp;
y(1:512) = 0;
coef_temp = [0.098891890744637 0.002579421311410 -0.084589441437739 -0.047578154855338 0.179439401283587 ...
    0.413044584947859];
for n = 13:524 
       y(n-12) = quantizer_input(x(n))*quantizer_coef(coef_temp(1))+...
                   quantizer_input(x(n-1))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(n-2))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(n-3))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(n-4))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(n-5))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(n-6))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(n-7))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(n-8))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(n-9))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(n-10))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(n-11))*quantizer_coef(coef_temp(1));
end
y_1st = y(1)
y_100st = y(100)
y_200st = y(200)