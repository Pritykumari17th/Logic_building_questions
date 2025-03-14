//write a constraint to generate an address where 9bits are always set to 1, and sequence of 111 or 000 should not occur in a 16-bit address

class pkt;
  
  rand bit [15:0]addr;
  
  constraint c{
    $countones(addr) == 9;
//     foreach (addr[i]) 
//       if (i < 14)
//         !(addr[i] == addr[i+1] && addr[i] == addr[i+2]);
    
    foreach(addr[i])
      if(i>1)
        !( addr[i-2] == addr[i-1] && addr[i-1] == addr[i]);
    
   }
  
  function void post_randomize();
    $display("%b\n", addr);
  endfunction
  
endclass

module tb;
  pkt p;
  initial begin
    p = new();
    
    repeat(20)
    p.randomize();
    
  end
endmodule

