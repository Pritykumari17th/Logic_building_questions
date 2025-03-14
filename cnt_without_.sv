
//count number of ones without using $countones

class pkt;
  rand bit [63:0] a;

  function void post_randomize();
    int count = 0;
    $display("%b", a);
    
    for (int i = 0; i < 64; i++) begin
      if (a[i] == 1)
        count++;
    end
    
    $display("no. of ones = %0d\n-----------------\n", count);
  endfunction
endclass

module tb;
  initial begin
    pkt p;
    p = new();
    
    repeat(20)
      p.randomize();
  end
endmodule
