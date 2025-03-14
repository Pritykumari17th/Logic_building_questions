// unique numbers between 99:100
/*
class sample;
  rand int a[10];

  constraint x {
    foreach(a[i])
      a[i] inside {[990:1000]}; // Generates values in the range 990-1000
  }

  function void post_randomize();
    real b[10]; // Define an array to store converted values
    foreach(a[i]) 
      b[i] = a[i] / 10.0; // Convert to real values between 99-100
    
    $display("%0p, ", b);
  endfunction
endclass

module tb;
  initial begin
    sample s1 = new();
    
    if (!s1.randomize()) 
      $display("Randomization failed!");

  end
endmodule
*/

//2D unique array


class sample;
  rand bit [5:0] a[3][4]; // Fixed-size 2D array

  constraint unique_values {
    foreach (a[i, j])
      foreach (a[m, n]) 
        if (!(i == m && j == n)) // Avoid self-comparison
          a[i][j] != a[m][n];   // Ensure uniqueness
  }

  function void post_randomize();
    $display("Generated Unique 2D Array:");
    foreach (a[i]) 
      $display("%p", a[i]); // Print each row
  endfunction
endclass

module tb;
  initial begin
    sample s1 = new();
    
    if (!s1.randomize())
      $display("Randomization failed!");
  end
endmodule


