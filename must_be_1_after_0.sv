//Q) write a constraint for any 10 digit number if any number comes as zero in b/w then next number must be 1 

class pkt;

rand int a[10];

constraint c{
foreach(a[i])
if (i < 9 && a[i] == 0)
a[i+1] == 1;
foreach(a[i])
a[i] inside { [0:9]}
;}

function void post_randomize();
$display("%0p",a);
endfunction

endclass

module tb;
  pkt p1 = new();

  initial begin
    repeat (10) begin
      p1.randomize();
    end
  end
endmodule


