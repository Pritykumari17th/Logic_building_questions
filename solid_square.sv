
//generate pattern 
/*
* * * * *
* * * * *
* * * * *
* * * * *
* * * * *
*/

class pkt;
  rand bit [3:0]n;
  
  string a = " *";
  
  constraint c{
    n >= 1 && n <= 10
    ;}
  
  function void post_randomize();
    $display("n : %0d",n);
    
    //without  using $write
    for (int i = 1; i <= n; i++) begin
      string row = "";
      for (int j = 1; j <= n; j++) begin
        row = {row, a};
      end
      $display("%0s", row);
    end
    

    
    //with  using $write
   /* for(int i = 1; i<=rows; i++)begin
      for(int j = 1; j<= rows; j++)begin
        $write("%0s",a);
      end
      $display();
    end*/
 
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
