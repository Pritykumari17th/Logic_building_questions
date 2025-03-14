/*class pkt;
  
  rand int a[10];
  
  int largest;
  int second_largest;
  int smallest;
  
  constraint c2 {
    foreach(a[i])
      a[i] inside {[1:100]};
  }
  
  function void post_randomize();
    largest = -1;
    second_largest = -1;
    smallest = 101;

    $display("%0p", a);
    
    foreach(a[i]) begin
      if (a[i] > largest) begin
        second_largest = largest;
        largest = a[i];
      end
      else if (a[i] > second_largest && a[i] < largest) begin
        second_largest = a[i];
      end

      if (a[i] < smallest)
        smallest = a[i];
    end
    
    $display("largest = %0d & smallest = %0d", largest, smallest);
    $display("second largest = %0d", second_largest);
  endfunction
  
endclass

module tb;

  initial begin
    pkt p;
    
    p = new();

    repeat(20)
      p.randomize();
  end
endmodule*/

class packet;
  
  rand bit [7:0] array[10];
 int ref_int,x,y;
  int ref_queue[$]; //queue to store array elements other than the largest number
  
  constraint cst {foreach(array[i])
    foreach(array[j])
      if(i != j)
        array[i]!= array[j];} // contraint to generate unique values
  
  function void post_randomize();
    foreach(array[i]) begin
      $write("%0d,",array[i]);
    end
    foreach(array[i]) begin
      if(ref_int < array[i])begin
        ref_int = array[i];
    end
    end
    
   //________________1st method___________
    
   /*  foreach(array[i]) begin
       if(array[i] != ref_int)
         ref_queue.push_back(array[i]);
         end
         foreach(ref_queue[i])begin
           if(x<ref_queue[i])
             x=ref_queue[i];
             end*/
    
    //2nd method___________________________
    
    
          foreach(array[i]) begin
              if(array[i] != ref_int)
                y=array[i];
              
      foreach(array[j]) begin
          if((y < array[j]) && array[j] < ref_int)
            y=array[j];
      end
       break;
           end
  endfunction
    endclass
    
    module tb;
      packet obj;
      initial begin
        obj=new();
        repeat (50) begin
          assert(obj.randomize());
          $display("\nref_int=%0d",obj.ref_int);
          
          $display("%0d is the 2nd largest num\n",obj.y);
          //$display("%0d is the 2nd largest num\n",obj.x);
          obj.ref_int=0;
          obj.y=0;
          obj.x=0;
          obj.ref_queue.delete();
        end
      end
    endmodule
