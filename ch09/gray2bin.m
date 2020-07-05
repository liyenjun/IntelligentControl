function binary = gray2bin(gray)

binary = zeros(size(gray));
binary(1) = gray(1);

for i = 2 : length(gray)
    x = xor(gray(i),binary(i-1));
    binary(i) = x;
end