//find the index number of msb and lsb of a 64-bit variable additionally count number of ones 

class pkt;
  
  rand bit [7:0]a;
  
  int j,lsb,msb;
  
   function void post_randomize();
   int count = 0;
     $display("a = %b",a);
     
     foreach(a[i])begin
       if(a[i] == 1)begin
       count++;
         msb = i;
//          break;
       end
     end
     
     for (j = 0; j < $size(a); j++) begin
       if(a[j] == 1) begin
         lsb = j;
//          break;
       end
     end
     
     $display("Lsb = %0d,	Msb = %0d",msb,lsb);
     $display("no. of ones %0d\n-----------------\n",count);
     $display("-------------------------------\n");
     msb=0;lsb=0;
  endfunction
  
endclass

module tb;

  initial begin
    pkt p;
    p=new();

    repeat(20)
    p.randomize();
  end
endmodule
 

