
// Fibonacci sequence:The next number is found by adding up the two numbers before it
class cnst;
  rand int num[];
  
  constraint x_size{num.size == 20;}
      
  function void post_randomize();
    
    foreach(num[i]) begin
      if(i==0)
        num[i] = 0;
    else if(i==1)
      num[i] = 1;
    else
      num[i] = num[i-2]+num[i-1];
    end
    
    
    $display("fibonacci series : %0p",num);
  endfunction
endclass

module tb;
  cnst c1;
  
  initial begin
    c1 = new();
    c1.randomize();
    
  end
endmodule 
