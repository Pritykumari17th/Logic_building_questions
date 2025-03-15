
// A palindrome number is a number that remains the same when digits are reversed

class cnst;
  rand int num;
  
    
  constraint x{num inside {[100:999]};}

  function void post_randomize();
    int rem, sum, temp;
//   rem = 0;
//   sum = 0;
  temp = num;
    for(int i = 0;i<3; i++) begin
      rem = num%10;
      sum = (sum*10)+rem;
      num = num/10;
    end
    if(temp == sum) 
      $display("----------%0d is a Palindrome number------------",temp);
    
    else
          $display("%0d is a not a Palindrome number",temp);
    
  endfunction

endclass

module tb;
  cnst c1;
  
  initial begin
    
    c1 = new();
    repeat(100) begin
    assert(c1.randomize);
      
    end
    
  end
endmodule