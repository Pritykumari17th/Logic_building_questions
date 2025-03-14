
/*class special_no;
  
  rand int num;
  
  
  constraint x{num inside {[1:1000]};}
  
  function int fact(int i);
    if(i < 2 )
      fact = 1;
      else
      
        fact = i*fact(i-1);    
  endfunction
  
  function void post_randomize();
    int rem, sum, temp;
    temp = num;
    while(num>0) begin
    rem = num %10;
    sum = fact(rem)+sum;
    num = num/10;
    end
    
    if (temp == sum)
      $display("%0d is a special number.",temp);
    else
      $display("%0d is not a special number.",temp);
  endfunction
  
endclass

module tb;
  special_no s1;
  
  initial begin 
    

    s1 = new();
repeat(10)
    s1.randomize();

  end
  
endmodule*/


/*class special;
  randc int a;
  
  constraint x{a inside {1,2,3,6,7,145};}
  
  
  function int fact(int a);
    if(a==0 || a==1)
      fact = 1;
    else
      fact = fact(a-1)*a;
  endfunction
  
  function void post_randomize();
    int temp;
    int rem;
    int result = 0;
    
    temp = a;
    
    while(a>0)begin
      rem = a%10;
      result = result+ fact(rem);
      a = a/10;
    end
    
    if(temp == result)
      $display("%0d is a special number",temp);
    else
      $display("%0d is not a special number",temp);
      
  endfunction
  
endclass

module tb;
  special s1;
  
  initial begin
    s1 = new();
    repeat(10)
    s1.randomize();
    
  end
  
endmodule*/



class special_no;
  
  rand int num;
  
//   int cnt;
  
  
  
  constraint x{num inside {145,1,2,40585,4,63,858};}
  
  function int fact(int i);
    if(i < 2 )
      fact = 1;
      else
      
        fact = i*fact(i-1);    
  endfunction
  
  function void post_randomize();
//     $display("%0d : %0d",num,fact(num));
//     $display("count = %0d",cnt);
    add();
  endfunction
  
  function void add();
    int rem, sum, temp;
    temp = num;
    while(num>0) begin
//     for(int i = 0; i< 3 ; i++) begin
    rem = num %10;
    sum = fact(rem)+sum;
    num = num/10;
    
    end
    
    if (temp == sum)
      $display("%0d is a special number.",temp);
    else
      $display("%0d is not a special number.",temp);
  endfunction
  
endclass

module tb;
  special_no s1;
  
  initial begin 
    
    repeat(10)begin
    s1 = new();
    s1.randomize();
    end
  end
  
endmodule

