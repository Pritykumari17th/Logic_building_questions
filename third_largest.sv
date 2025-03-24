class pkt;
  rand int a[10];
  int largest, second_largest, third_largest;

  constraint c {
    foreach (a[i]) a[i] inside {[0:100]};
  }

  function void post_randomize();
    largest = -1;
    second_largest = -1;
    third_largest = -1;
    foreach (a[i]) begin
      if (a[i] > largest) begin
        third_largest = second_largest;
        second_largest = largest;
        largest = a[i];
      end else if (a[i] > second_largest && a[i] < largest) begin
        third_largest = second_largest;
        second_largest = a[i];
      end else if (a[i] > third_largest && a[i] < second_largest) begin
        third_largest = a[i];
      end
    end
    $display("a = %0p", a);
    $display("largest = %0d, second_largest = %0d, third_largest = %0d", largest, second_largest, third_largest);
  endfunction
endclass

module tb;
  pkt p1;
  initial begin
    p1 = new();
    repeat (10) p1.randomize();
  end
endmodule
