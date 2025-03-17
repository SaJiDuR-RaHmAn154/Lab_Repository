module comparator 
(
    input wire x,
    input wire y,
    output wire z
);
wire x_,y_,p,q;
not(x_,x);   
not(y_,y);   
and(q,x,y);
and(p,x_,y_);
or(z,p,q);

endmodule