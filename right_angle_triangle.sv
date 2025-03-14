/*  
* * * * *
* * * *
* * *
* *
*

possible 4 questions*/

class pkt;
  
  rand int n;
  
  string a = " *";
  
  constraint c{
//     n >= 1 && n <= 10
    n==5
    ;}
  
  
  function void post_randomize();
//  *
//  * *
//  * * *
//  * * * *
  $display("n : %0d",n);
    for(int i = 1; i<= n ; i++) begin
      string row = "";
      for(int j = 1 ; j<=i; j++)begin
        row = {row,a};  
      end
      $display("%0s", row);
  
    end
    endfunction
// * * * *
// * * *
// * *
// *
    /*
    for(int i = 1; i<=n-1 ; i++)begin
      string row ="";
      for(int j = (n-i)-1; j >= 0; j--)begin
        row = {row,a};
      end
      $display("%0s", row);
    end
  endfunction*/
  
/*
    function void post_randomize();
//        *
//      * *
//    * * *
//  * * * *
    for(int i = 1; i<=n ; i++)begin
      string row ="";
      for(int j = 1; j <= n; j++)begin
        row = {row,a};
      end
      $display("%0s", row);
    end
  endfunction
  */
  
endclass


module tb;
  
  initial begin
    
    pkt p;
    p = new();
    
//     repeat(10)
    p.randomize();
  end
endmodule
