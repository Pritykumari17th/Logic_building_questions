//size greater than 20 and values should be inside 20, even location should have odd numbers and odd locations should have even numbers, and find the difference between the max odd and max even numbers and the result should be always positive

class pkt;
  rand int a[];
  
  constraint size{a.size inside {[20:30]};
                  foreach(a[i])
                    a[i] inside {[1:20]};}
  
  constraint o_e{
    foreach(a[i])
      if(i%2==0)
        a[i] % 2 != 0;
    else
      a[i] % 2 == 0
    ;}

  
  function void post_randomize();

    int e_max=0,o_max=0;
    $display("%p",a);
    
    foreach(a[i])begin
      if(i%2==0 && a[i]>o_max)begin

//           if(a[i]>o_max)
        o_max = a[i];

      end
      if(i%2!=0 && a[i]>e_max)begin
//           if(a[i]>e_max)
            e_max = a[i];

      end
    end
    
    $display("even maximum : %0d,	odd maximum : %0d\n",e_max,o_max);

    if(o_max>e_max)
      $display("Difference when odd is maximun is %0d",o_max-e_max);
    else
      $display("Difference when even is maximum is %0d",e_max-o_max);
    $display("-------------------------------\n");
  endfunction 
  
endclass

module tb;
  
  initial begin
    pkt p;
    p = new();
    
    repeat(20)
    assert(p.randomize());
  end
endmodule
