
//a and b are two integer variables,
// Obtain values such that b=a+1,b=a+2 and b=a+3 with their weightage being 60 ,30 and 10 respectively
// In addition to this,also evaluate the number of times these desired values of b are obtained.
// And if at all b does not take any of these values in the expression,then find the number of such occurrences of b.


class packet;
  rand bit [2:0]a;
  rand bit [3:0]b;

  
  
  constraint c1 { b dist { (a+1) := 40, (a+2) := 30, (a+3) := 20, b := 10};}
  
 function void post_randomize();
   $display("a=%0d,			b=%0d \n",a,b);
  endfunction
  
endclass

module tb;
  initial begin
    packet p;
    int cnt1, cnt2, cnt3, cnt4;
    
    p=new();
    repeat(200)begin
    p.randomize();
      if(p.b == (p.a+1))
        cnt1++;
      else if(p.b == (p.a+2))
        cnt2++;
      else if(p.b == (p.a+3))
        cnt3++;
      else 
        cnt4++; 
    end
    
    $display("cnt1 for (a+1) =  %0d,\ncnt2 for (a+2) =  %0d,\ncnt3 for (a+3) =  %0d,\ncnt4 for other =  %0d,\n  ",cnt1, cnt2, cnt3, cnt4);
    
  end
endmodule


