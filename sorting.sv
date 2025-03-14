// sorting

class sample;
  rand int a[10];
  
  
  constraint y{ foreach (a[i])
    a[i] inside {2,4,6,1,21,11,54,12,95,45}
    ;}
  
  constraint x{
    foreach (a[i])
      if(i>0 )
      a[i] > a[i-1]
    ;}
  
  function void post_randomize();
    $display("%0p",a);
  endfunction
  
endclass

module tb;
  sample s1;
  initial begin
    s1 = new();

    s1.randomize();
    
  end
  
endmodule



