//write a code to generate an array such that only the prime indices take value 1 and the rest can take any value.

class pkt;
  
  rand int i;
  
  rand int a[20];
  
  constraint x{
    foreach(a[i])
      if(is_prime(i))
        a[i] == 1;
        else 
          a[i] != 1;
    
        foreach(a[i])
          a[i] inside {[0 :200]}
    ;}
  
  function int is_prime(int i);
    if(i<2)
      return 0;
    for(int j = 2; j<=i/2; j++)begin
      
      if(i%j == 0)
        return 0;
    end
    return 1;
  endfunction
      
  
  function void post_randomize();
    $display("a = %0p, ", a); 
  endfunction
  
endclass

module tb;
  pkt p;
  
  initial begin
    
    p = new();
    
//     repeat(100)
    p.randomize();
   
  end
endmodule
