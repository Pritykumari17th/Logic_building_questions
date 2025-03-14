// Kaprekar's number :- A Kaprekar number is a number whose square when divided into two parts and such that sum of parts is equal to the original number and none of the parts has value 0.

// print the pattern.

class pkt;
  
  rand int n;
  
  constraint x {
    n inside {1, 9, 45, 55, 99, 297, 703, 999, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}; 
  }

  function int cnt(int a);
    int count = 0;
    while (a > 0) begin
      a = a / 10;
      count++;
    end
    return count;
  endfunction

  function void Kaprekar();
    int sq, temp, count, div, left_part, right_part, sum;

    sq = n * n; // Square of the number
    temp = sq;
    count = cnt(sq);
    
    for (int i = 0; i < count; i++) begin
      div = 10 ** i; // Divide at different places
      left_part = temp / div;
      right_part = temp % div;

      if ((right_part != 0 && (left_part + right_part) == n)  || n == 1) begin
        $display("Kaprekar Number Found: n = %0d, Square = %0d, Parts = %0d + %0d", n, temp, left_part, right_part);
        return;
      end
    end

    $display("Not a Kaprekar Number: n = %0d", n);
  endfunction

  function void post_randomize();
    Kaprekar();
  endfunction

endclass

module tb;
  pkt p1 = new();
  initial begin
    repeat(10)
    p1.randomize();
  end
endmodule
