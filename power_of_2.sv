class pkt;

//rand bit [7:0]a;

rand int power;
rand int b;

/*constraint c{
$countones(a) == 1
;}*/

constraint b1{
power inside {[0:7]};
b == 2**power
;}


function void post_randomize();
//$display("a = %0d",a);
$display("b = %0d",b);

endfunction

endclass

module tb;
pkt p1;
initial begin
p1 = new();
repeat(10)
p1.randomize();
end

endmodule