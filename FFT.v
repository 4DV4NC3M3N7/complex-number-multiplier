module FFT(a,b,c,d,out);
input [15:0]a,b,c,d;
output[31:0]out;

wire [31:0] re,im;
wire [31:0]e,f,g,h;

//(a+bi)(c+di)=(a.c-b.d) + (a.d+b.c)i
//               e   f       g   h
//						 re			 im	
//The real part calculation
//a.c
Mult M_0(.a(a),.b(c),.out(e));
//b.d
Mult M_1(.a(b),.b(d),.out(f));
//(a.c-b.d) 
Adder add_0(.a(e),.b(f),.sum_dif(re),.carry_in(1),.add_sub(1));

//The real part calculation
//a.d
Mult M_2(.a(a),.b(d),.out(g));
//b.c
Mult M_3(.a(b),.b(c),.out(h));
//(a.d+b.c) 
Adder add_1(.a(g),.b(h),.sum_dif(im),.carry_in(0),.add_sub(0));



endmodule  