function input = quantizer_input(x)
for a = 1:length(x)
q = quantizer('fixed','round','saturate',[20 14]);
fix_x = 0;
max_int = 0;
max_dec = 0;
for j = 0:4
    max_int = max_int+2^j;
end
for i = 1:14
    max_dec = max_dec + 2^-i;
end
max = max_int + max_dec;
if(x(a) >= max)
    x(a) = max;
    fix_x = bin2dec(num2bin(q,x(a)));
elseif(x(a) < 0)
    if(x(a) <= -2^5)
        x(a) = -2^5;
    end
    fix_x = -(2^20-bin2dec(num2bin(q,x(a))));
else
    fix_x = bin2dec(num2bin(q,x(a)));
end
input(a)=fix_x/2^14;
end
end
