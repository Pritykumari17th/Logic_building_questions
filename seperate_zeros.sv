// Seperate zeros while keeping the sequence same

module tb;
  int temp;
  int a[13] = {1,0,9,3,4,5,6,0,8,0,0,0,4};
  initial begin
    $display("a= %0p",a);
    foreach(a[j])begin
    foreach(a[i]) begin
      if(a[i] == 0 && a[i+1] != 0)begin
        temp = a[i+1];
        a[i+1] = a[i];
        a[i] = temp;
      end
    end
  end
    $display("output a= %0p",a);
  end
endmodule
        
    
