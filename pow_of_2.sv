// write a code to obtain 16bit addr value that are only in power of 2 without using power operator.

class pkt;
  
  rand bit [15:0]addr[10];


  constraint c{foreach(addr[i])
    $countones(addr[i])==1
    ;}
  
  function void post_randomize();
    foreach(addr[i])begin
      $display("addr[%0d] = %0d ",i,addr[i]); 
    end
  endfunction
  
endclass

module tb;
  pkt p;
  initial begin
 p = new();
    
//     repeat(10)
    p.randomize();
   
  end
endmodule
  
