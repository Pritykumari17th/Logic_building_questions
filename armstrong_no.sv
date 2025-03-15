// An Armstrong number is one whose sum of digits raised to the power three equals the number itself.For example 371 is an Armstrong number because 3**3 + 7**3 + 1**3 = 371.

class cnst;
  randc int num;
  
  constraint x{num inside {[100:999]};}
  
  function void post_randomize();
    int rem, sum, temp;
    temp = num;
    
    for(int i = 0; i<3; i++) begin
      rem = num%10;
      sum = (rem**3)+sum;
      num = num/10;
    end
    
    if(temp == sum)
      $display("----------------------%0d is an Armstrong number---------------------",temp);
    else 
      $display("%0d is NOT an Armstrong number",temp);
    
  endfunction
endclass

module tb;
  cnst c1;
  
  initial begin
    c1 = new();
    repeat (500) begin
    c1.randomize();
    end
  end
  
endmodule
