randn('seed',123)
x(1:524) = 0;
x_temp = randn(1, 512);
x(13:524) = x_temp;
y(1:512) = 0;
coef_temp = [0.098891890744637 0.002579421311410 -0.084589441437739 -0.047578154855338 0.179439401283587 ...
    0.413044584947859];
for n = 13:183 
       y(3*n-38) = quantizer_input(x(3*n-26))*quantizer_coef(coef_temp(1))+...
                   quantizer_input(x(3*n-27))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-28))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-29))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-30))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-31))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-32))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-33))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-34))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-35))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-36))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-37))*quantizer_coef(coef_temp(1));
        y(3*n-37) = quantizer_input(x(3*n-25))*quantizer_coef(coef_temp(1))+...
                   quantizer_input(x(3*n-26))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-27))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-28))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-29))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-30))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-31))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-32))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-33))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-34))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-35))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-36))*quantizer_coef(coef_temp(1));
        y(3*n-36) = quantizer_input(x(3*n-26))*quantizer_coef(coef_temp(1))+...
                   quantizer_input(x(3*n-27))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-28))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-29))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-30))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-31))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-32))*quantizer_coef(coef_temp(6))+...
                   quantizer_input(x(3*n-33))*quantizer_coef(coef_temp(5))+...
                   quantizer_input(x(3*n-34))*quantizer_coef(coef_temp(4))+...
                   quantizer_input(x(3*n-35))*quantizer_coef(coef_temp(3))+...
                   quantizer_input(x(3*n-36))*quantizer_coef(coef_temp(2))+...
                   quantizer_input(x(3*n-37))*quantizer_coef(coef_temp(1));
end
y_1st = y(1)
y_100st = y(100)
y_200st = y(200)