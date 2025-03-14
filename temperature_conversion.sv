
/*formulas for temperature
  
  (c-0)/100 = (f-32)/180 = (k-273)/100
  
  container which has 6 combination of conversion and it will pick 1 randomly 
  */

typedef enum{cel_far, cel_kel, far_cel, far_kel, kel_cel, kel_far}pick;

class converter;
  
  rand pick p1;
  rand int a;
  real cel, far, kel;
  constraint c{a inside {[0:374]};}
  
  function void post_randomize();
    if(p1 == cel_far)begin
      cel = a;
      far = (((cel-0)/100)*180)+32;
      $display("cel = %0d°C,	far = %0.2f°F",cel,far);
    end
    else 
      if(p1 == cel_kel)begin
        cel = a;
        kel = cel+273.15;
        $display("cel = %0d°C,	kel = %0.2fK",cel,kel);
      end
    else
      if(p1 == far_cel ) begin
        far = a;
        cel = ((far - 32)/180)*100;
        $display("far = %0d°F,	cel = %0.2f°C",far,cel);
      end
    else
      if(p1 == far_kel)begin
        far = a;
        kel = (((far - 32)/180)*100)+273.15;
        $display("far = %0d°F,	kel = %0.2fK",far,kel);
      end
    else
      if(p1 == kel_cel)begin
        kel = a;
        cel = kel - 273.15;
        $display("kel = %0dK,	cel = %0.2f°C",kel,cel);
      end
    else
      if(p1 == kel_far)begin
        kel = a;
        far = (((kel - 273.15)/100) *180)+32;
        $display("kel = %0dK,	far = %0.2f°F",kel,far);
    end
  endfunction
  
endclass

module tb;
  
  converter c1 = new();
  
  initial begin
    repeat(100)
    c1.randomize();
    
  end
endmodule