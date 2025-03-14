
class cnst;
//   rand int a[];
  
  int a[10]= '{2,7,9,5,34,77,50,65,45,3};
  
//   constraint x{a.size == 10;
//                foreach (a[i])
//                  a[i] inside {[1:100]}
//               ;}
  
  function int prime(int a);
    
    if(a < 2)
          return 0;
    for(int j = 2;j<=a/2; j++)begin
     
       if(a%j == 0)
         return 0;
       end
         return 1;
     
  endfunction
  
  function void post_randomize();
    $display("array : %0p",a);
    
    foreach (a[i]) begin
      if(prime(a[i]))
        $write(" %0d",a[i]);
    end
  endfunction
  
endclass

module tb;
  cnst c1;
  initial begin
    c1 = new();
    c1.randomize();
  end
  
endmodule

// class cnst;
//   rand int a[];  // Declare the dynamic array
  
//   // Constraint for array size and element value range
//   constraint x {
//     a.size == 10; // Array size is 10
//     foreach (a[i])
//       a[i] inside {[1:100]}; // Values inside the range [1, 100]
//   }
  
//   // Function to check if a number is prime
//   function int is_prime(int num);
//     if (num < 2) 
//       return 0; // Numbers less than 2 are not prime
//     for (int j = 2; j <= num / 2; j++) begin
//       if (num % j == 0)
//         return 0; // If divisible by any number other than 1 and itself, it's not prime
//     end
//     return 1; // If not divisible, it's prime
//   endfunction

//   // Function to check prime numbers in the array and display them
//   function void post_randomize();
//     $display("Array values: %0p", a); // Display the full array
//     $display("Prime numbers in the array:");
//     foreach (a[i]) begin
//       if (is_prime(a[i])) // Call is_prime function for each element
//         $write("%0d ", a[i]); // Print prime numbers
//     end
//     $display(""); // Newline after the primes are printed
//   endfunction

// endclass

// module tb;
//   cnst c1; // Create an instance of the cnst class
  
//   initial begin
//     c1 = new(); // Instantiate the class
    
//     c1.randomize();
// //     if (c1.randomize()) begin // Perform randomization
// //       c1.post_randomize(); // Display the array and prime numbers
// //     end else begin
// //       $display("Randomization failed!");
// //     end
//   end
  
// endmodule


// class sample;
//   rand int a;
  
//   constraint x { a inside {[1:100]}; }
  
//   function int prime(int a);
//     if (a < 2)
//       return 0;  // Non-prime
//     for (int i = 2; i <= a/2; i++) begin
//       if (a % i == 0)
//         return 0;  // Non-prime
//     end
//     return 1;  // Prime
//   endfunction
  
//   function void post_randomize();
//     if (prime(a)) // Only display if 'a' is prime
//       $display("%0d is a prime number.", a);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
//   initial begin
//     s1 = new();
//     repeat(50) begin
//       s1.randomize();
//     end
//   end
// endmodule
