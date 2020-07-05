function PI=RGA_fitfun(chro)

global MIN_offset
MIN_offset=30;

x=chro(1);
y=chro(2);

f=5+x^2+y^2;
PI=MIN_offset-f;