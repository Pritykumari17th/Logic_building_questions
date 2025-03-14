/*// Pattern- 4 1 2 9 8 25 18 49 32 81

class pkt;
  rand int a[10];
  
  constraint c{
    foreach(a[i])
      if(i<1)
        a[i] == 4;
    else if(i%2 == 1 )
      a[i] == i*i;
    else
      a[i] == i*((i/3)+1)
  ;}
  
  function void post_randomize();
    $display("%0p",a);
  endfunction
  
endclass

module tb;
  
  pkt p;
  
  initial begin
    
    p = new();
    
    p.randomize();
    
  end
endmodule

*/


// //  1. '{0, 1, 0, 2, 0, 3, 0, 4, 0, 5}


// class sample;
//   rand int a[];
  
//   constraint x{
//     a.size == 10
//     ;}
//   constraint y{
//     foreach(a[i])
//       if(i%2 == 0)
//         a[i] == 0;
//     else
//       a[i] == (i+1)/2
//     ;}
  
//   function void post_randomize();
//     $display("%0p",a);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
    
//     s1.randomize();
    
//   end
  
// endmodule

// //  2. Constraint to generate unique numbers between 99 to 100.

// class sample;
//   rand int a[];
//   real b[10];
//   constraint x{
//     a.size == 10;
//     foreach(a[i])
//       a[i] inside {[990:1000]}
//   ;}
  
//   constraint y{
//     foreach(a[i])
//       foreach(a[j])
//         if(i != j)
//           a[i] != a[j]
        
// //       if(i>0)
// //         a[i] != a[i-1]
//     ;}
  
//   function void post_randomize();
//     foreach(a[i])
//       b[i] = a[i]/10.0;
//     $display("%0p",b);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
    
//     s1.randomize();
    
//   end
  
// endmodule

// // 6. Write a constraint for two random variables such that one variable should not match with the other & the total number of bits toggled in one variable should be 5 w.r.t the other.

// class sample;
//   rand bit [7:0]a;
//   rand bit [7:0]b;
  
//   constraint y{
//     foreach(a[i])
//       a[i] != b[i];
//     $countones(a) == 5
//     ;}
  
//   function void post_randomize();
//     $display("a = %b\nb = %b",a,b);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(5)
//     s1.randomize();
    
//   end
  
// endmodule

// 7. Write a constraint such that when rand bit[3:0] a is randomized,the value of ?a? should not be same as 5 previous occurrences of the value of ?a?.

// class sample;
//   rand bit [7:0]a;
//   rand bit [7:0]b;
  
//   constraint y{
//     foreach(a[i])
//       a[i] != b[i];
//     $countones(a) == 5
//     ;}
  
//   function void post_randomize();
//     $display("a = %b\nb = %b",a,b);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(5)
//     s1.randomize();
    
//   end
  
// endmodule

// // 8. Constraint to generate 0, 1, x and z randomly

// class sample;
//   logic a;
//   rand bit [1:0]ctrl;
  
  
//   constraint y{
//     ctrl dist{2'b00:=5,2'b01:=5,2'b10:=5,2'b11:=5}
//     ;}
  

//   function void post_randomize();
// //     $display("ctrl = %0b",ctrl);

//     case(ctrl)
//       2'b00: a = 'z;
//       2'b01: a = 'x;
//       2'b10: a = 0;
//       2'b11: a = 1;
//     endcase
    
//     $display("a = %0d",a);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(10)
//     s1.randomize();
//   end
  
// endmodule


// // 9. Write a program using dynamic array.
// // [i] array1: no. of elements should be between 30-40.
// // [ii] array2: sum of all elements should be < 100 
// // [iii] array3: sum of all elements should be > 100

// class sample;
//   rand int a[];
//   rand int a1[];
//   rand int a2[];
  
//   constraint s{
//     a.size == 5;
//     a1.size == 5;
//     a2.size == 5
//     ;}
  
//   constraint x{
//     foreach(a[i])
//       a[i] inside{[30:40]};
//     foreach(a1[i])
//       a1[i] inside{[1:50]};
//     foreach(a2[i])
//       a2[i] inside{[1:50]};
//     }
  
  
  

//   function void post_randomize();
//     $display("a = %0p\na1 = %0p		sum = %0d \na2 = %0p		sum = %0d",a,a1,a1.sum(),a2,a2.sum());
//     $display("----------------------------------------------------");
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(10)
//       s1.randomize with {a1.sum<100;
//     a2.sum>100;};
//   end
  
// endmodule


// //10.There are two constraints applied to same variable. One will generate the 
// // value within the range of [25:50] and another expression should be greater 
// // than 40. What should be the value generated, and what is the reason?

// class sample;
//   rand int a[];
  
//   constraint s{
//     a.size == 10
//    ;}
  
//   constraint x{
//     foreach(a[i])
//       a[i] inside{[25:50]}
//       ;}
  
  
  

//   function void post_randomize();
//     $display("a = %0p",a);
// //     $display("----------------------------------------------------");
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
// //     repeat(10)
//       s1.randomize with {foreach(a[i])
//         a[i] > 40;};
//   end
  
// endmodule


// // 11. Constraint with array size of 5 to 10 values & the array values 
// // should be in ascending order.


// class sample;
//   rand int a[];
  
//   constraint s{
//     a.size inside {[5:10]};
//     foreach(a[i])
//       a[i] inside{[1:50]}
//    ;}
  
//   constraint x{
//     foreach(a[i])
//       if(i>0)
//       a[i] > a[i-1]
//       ;}

//   function void post_randomize();
//     $display("a = %0p		size = %0d",a,a.size);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
// //     repeat(10)
//     s1.randomize();
//   end
  
// endmodule

// // 12. Constraint with array size of 5 to 10 values & the array values should be 
// // in descending order.

// class sample;
//   rand int a[];
  
//   constraint s{
//     a.size inside {[5:10]};
//     foreach(a[i])
//       a[i] inside{[1:50]}
//    ;}
  
//   constraint x{
//     foreach(a[i])
//       if(i>0)
//         a[i] < a[i-1]
//       ;}

//   function void post_randomize();
//     $display("a = %0p		size = %0d",a,a.size);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
// //     repeat(10)
//     s1.randomize();
//   end
  
// endmodule

// // 16. Randomize the below variables:
// // class randvar;
// // rand bit[7:0] var1, var2, var3, var4;
// // endclass
// // i) Randomize all variables.
// // ii) Randomize only var2.
// // iii) Randomize var1 & var4.
// // iv) Randomize var1, var3 and var4.

// class sample;
//   rand bit [7:0]var1; 
//   rand bit [7:0]var2;
//   rand bit [7:0]var3;
//   rand bit [7:0]var4;
  
//   function void pre_randomize();
//     var1.rand_mode(0);
//     var3.rand_mode(0);
//     var4.rand_mode(0);
//   endfunction
  
//   function void post_randomize();
//     $display("var1 = %0d,	var2 = %0d, var3 = %0d, var4 = %0d",var1, var2, var3, var4);
    
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(10)
//     s1.randomize();
//   end
  
// endmodule


// // 17. Write a single constraint to generate random values for bit[8:0] 
// // variable in the below range: 1-34, 127, 129-156, 192-202, 257-260.

// class sample;
//   rand int a[];
  
//   constraint s{
//     a.size inside {[5:10]};
//     foreach(a[i])
//       a[i] inside{[1:34], 127, [129:156], [192:202], [257:260]}
//    ;}
  
// //   constraint x{
// //     foreach(a[i])
// //       if(i>0)
// //         a[i] < a[i-1]
// //       ;}

//   function void post_randomize();
//     $display("a = %0p		size = %0d",a,a.size);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
// //     repeat(10)
//     s1.randomize();
//   end
  
// endmodule


// // 19. What is wrong with the below code? What?s the correct process to write 
// // the constraint?
// // class const;
// // rand bit[7:0] low, mid, high;
// // constraint const_1 {low<mid<high;}
// // endclass

// class cnst;
// rand bit[7:0] low, mid, high;
//   constraint const_1 {low<mid;
//                       mid<high;}
  
//     function void post_randomize();
//       $display("low %0d,	mid = %0d,		high = %0d",low,mid,high);
//   endfunction
  
// endclass

// module tb;
//   cnst c1;
  
//   initial begin
//     c1 = new();
// //     repeat(10)
//     c1.randomize();
//   end
  
// endmodule


// // 22. Generate 32-bit random number with only one bit set (should not use $countones).

// class sample;
//   rand bit [7:0]a;
//   rand bit [1:0]shift;
  
//   constraint s{
//     a==1 << shift
//    ;}
  
//   function void post_randomize();
//     $display("a = %b",a);
//   endfunction
  
// endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     repeat(10)
//     s1.randomize();
//   end
  
// endmodule


// // 25. Write a constraint to randomly generate unique prime numbers 
// // in an array between 1 and 200. The generated prime numbers 
// //   should have 7 in it (Eg.: 7, 17, 37..)
  
  
// class pkt;
//   rand int a;
  
//   constraint x{
//     a inside {[1:200]}
//     ;}
  
//   function int prime(int a);
//     if(a<2)
//         return 0;
//     for(int i = 2; i <= a/2; i++)begin
//       if(a%i==0)
//           return 0;
//     end
//         return 1;       
//   endfunction
  
//   function void post_randomize();
//     int temp,rem;
    
//     temp = a;
    
//     if(prime(a))begin
      
//       while(temp>0)begin
        
//         rem = temp%10;
        
//         if(rem == 7) begin
          
//       $display("a = %0d",a);
//           break;
//         end
//         temp = temp/10;

//       end
//     end
//   endfunction
  
// endclass

// module tb;
//   pkt p1;
//   initial begin
//     p1 = new();
    
//     repeat(50)
//     p1.randomize();
    
//   end
  
// endmodule


// // 26. Write a constraint to generate multiples of power 2.

//  class sample;
//    rand int a;
//    rand bit [2:0]i;
   
//    constraint x{
//      a == 2**i
//      ;}
   
//    function void post_randomize();
//      $display("2 ** %0d = %0d",i,a);
//    endfunction
//  endclass

// module tb;
//   sample s1;
//   initial begin
//     s1 = new();
//     repeat(5)
//     s1.randomize();
//   end
// endmodule 



// --------------------------------PDF 3--------------------------------------



// // 6. Write a constraint to generate a random value for a var1 [7:0] within 
// // 50 and var2 [7:0] with the non-repeated value in every randomization? 

//  class sample;
   
//    rand bit [7:0]var1;
//    rand bit [7:0]var2;
   
//    constraint x{
//      var1 inside {[0:50]}
//      ;}
   
//    constraint y{
//      unique{var2}
//      ;}
   
//    function void post_randomize();
//      $display("var1 = %0d	var2 = %0d",var1, var2);
//    endfunction
//  endclass

// module tb;
//   sample s1;
//   initial begin
//     s1 = new();
//     repeat(5)
//     s1.randomize();
//   end
// endmodule 

// // 7. Without using randomization method or rand keyword(modifiers), 
// // generate an array of unique values.

//  class sample;
   
//    int a[10];
 
//    function void display();
//      foreach(a[i])
//        a[i] = (i+1)*(i+1);
//        a.shuffle();
//      $display("a = %0p",a);
//    endfunction
//  endclass

// module tb;
//   sample s1;
  
//   initial begin
//     s1 = new();
//     s1.display();
    
//   end
// endmodule 



// class packet;
//  rand logic a;
//  rand logic b;
 
//   constraint c{b inside {0,1};}
  
  
//  function void post_randomize();
// //  b = $urandom_range(0,1); 
//    $display(a,	b);
   
//  if (b)
//  a = a ? 'x : 'z; 
   
// //     $display(a); 
// // $display();
//  endfunction
// endclass

// module test;
//  initial begin
//  packet pkt = new; 
//  repeat (10) begin
//  pkt.randomize(); 
// //  $display(pkt.a); 
//  end
//  end
// endmodule

/*
// 22. What is the constraint to generate the pattern 9 7 5 3 1 8 6 4 2 0 ?


class sample;
  rand int a[10];
  
  constraint x{
    foreach(a[i])
      if(i<5)
        a[i] == 10 - ((i*2)+1);
//         a[i] == 10 - ((i+1)*2)+1;
    else
      a[i] == 18-(i*2)
    ;}
  
  function void post_randomize();
    $display("a = %0p",a);
  endfunction
  
endclass

module tb;
  sample s1;
  
  initial begin
    s1 = new();
    
    s1.randomize();
    
  end
  
endmodule
*/

// 01010101...........pattern

// class temp;
  
//   rand bit [7:0]a;
  
//   constraint c{ foreach(a[i])
//     if(i>0)
//       a[i] != a[i-1]
//       ;}
  
//   function void post_randomize();
//     $display("%0b",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
    
//     t1.randomize();
    
//   end
// endmodule

// 1234554321

// class temp;
  
//   rand int a[10];
  
//   constraint c{
//     foreach(a[i])
//       if(i<5)
//       a[i] == i+1;
//     else
//       a[i] == 10-i
//   ;}
  
//   function void post_randomize();
//     $display("%0p",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     t1.randomize();
    
//   end
// endmodule

// // 9 19 29 39 49 59 69 79

// class temp;
  
//   rand int a[];
  
//   constraint c{
//       a.size == 10;
//     foreach(a[i])
//       a[i] == 9+(i*10)
//     ;}
  
//   function void post_randomize();
//     $display("%0p",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     t1.randomize();
    
//   end
// endmodule


// // 5-10 15-20 25-30

// class temp;

//   rand int a[];
  
//   constraint size{
//   a.size == 10
//     ;}
  
//   constraint c{
//     foreach(a[i])
//       if(i%2==0)
//         a[i] == 5*(i+1);
//         else
//           a[i] == -(5*(i+1))
//   ;}
  
//   function void post_randomize();
//     $display("%0p",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     t1.randomize();
    
//   end
// endmodule

// // 1122334455

// class temp;
  
//   rand int a[10];
  
//   constraint c{
//     foreach(a[i])
//       a[i] == (i+2)/2
//     ;}
//     function void post_randomize();
//     $display("%0p",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     t1.randomize();
    
//   end
// endmodule


// //  1.35 to 2.57

// class temp;
  
//   rand int a;
  
//   constraint c{
//       a inside {[1350:2570]}
//     ;}
  
  
//     function void post_randomize();
//       real b;
//       b = a/1000.0;
//       $write("%0.3f, ",b);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     repeat(5)
//     t1.randomize();
    
//   end
// endmodule


// //  0102030405

// class temp;
  
//   rand int a[10];
  
//   constraint c{
//     foreach(a[i])
//       if(i%2 == 1)
//         a[i] == (i+2)/2;
//         else
//           a[i] == 0
//     ;}
  
  
//     function void post_randomize();
//       $display("%0p ",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
// //     repeat(5)
//     t1.randomize();
    
//   end
// endmodule


// // 25,27,30,36,40,45

// class temp;
  
//   rand int a;
  
//   constraint c{a>24;a<46
//                    ;}
      
//       constraint y{
//           (a %5 == 0) || (a %9 == 0);

//           a != 35
//         ;}
    
  
  
//     function void post_randomize();
//       $display("%0d ",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     repeat(5)
//     t1.randomize();
    
//   end
// endmodule


//  class temp;
  
//   rand int a;
  
//   constraint c{a>24;a<46
//                    ;}
      
//       constraint y{
//           (a %5 == 0) || (a %9 == 0);

//           a != 35
//         ;}
    
  
  
//     function void post_randomize();
//       $display("%0d ",a);
//   endfunction
  
// endclass

// module tb;
//   temp t1;
//   initial begin
//     t1 = new();
//     repeat(5)
//     t1.randomize();
    
//   end
// endmodule

// class cons;
//  rand bit [31:0]a;
// //  constraint no_of_ones{$countones(a)==12;}
// //  We can use
//   constraint no_of_ones{$countbits(a,0)==12;}
//  constraint x{foreach(a[i])
//    if(i>0&&a[i]==0)
//  a[i]!=a[i-1];}
//  function void post_randomize();
//    $display("Randomized 32 bit variable having 12 ones is:%0b",a);
//    $display("Displaying no of ones in the variable that we randomized is %0d",$size(a)-$countones(a));
//  endfunction
//  endclass
//  cons c;
//  module test;
//  initial
//  begin
 
//  c=new;
//  c.randomize;
//  end
// endmodule

// class cons;
//  rand int a[10];
//  constraint x{foreach(a[i])
//  foreach(a[j])
//  if(i!=j)
//    a[i]!=a[j] && a[i] %3 == 0;}
//  constraint y{foreach(a[i])
//  a[i] inside {[1:100]};}
//  function void post_randomize();
//  $display("Unique numbers are %0p",a);
//  endfunction
//  endclass
//  cons c;
//  module test;
//  initial
//  begin
//    c=new;
//    c.randomize();
//  end
//  endmodule


// class cons;
//  rand int a[10];
//  //for consecutive elements
// //  constraint x{foreach(a[i])
// //  a[i]==i;}
//  //for non consecutive elements
//  constraint y{foreach(a[i])
//  foreach(a[j])
//  if(i!=j)
//  a[i]!=a[j];}
//  constraint z{foreach(a[i])
//  a[i] inside {[0:100]};}
//  function void post_randomize();
//  $display("Conseutive values are %0p",a);
//  endfunction
//  endclass
//  cons c;
//  module test;
//  initial
//  begin
//    c=new;
//  assert(c.randomize);
//  end
//  endmodule


//  class cons;
//  rand bit [15:0]a;
//  constraint x{foreach(a[i])
//  if(i<15)
//  if(i%2==0)
//  a[i+1]==a[i];
//  else
//  a[i]!=a[i+1];}
//  function void post_randomize;
//  $display("%b",a);
//  endfunction
//  endclass
//  cons c;
//  module top;
//  initial
//  begin
//     c=new;
//    repeat(5)
//  c.randomize;
//  end
//  endmodule


//  class cons;
//  rand bit [8:0]a;
//  rand bit [8:0]b;
// //  constraint not_equal{a!=b;}
//    constraint count{$countones(a^b)==5;}
//  function void post_randomize;
//    $display("a is %b\nb is %b\n",a,b);
//  endfunction
//  endclass
//  cons c;
//  module top;
//  initial
//  begin
//  c=new;
//    repeat(5)
//  c.randomize;
 
//  end
//  endmodule

//  class cons;
//  rand bit [3:0]a;
//  int que[$];
//  constraint x{!(a inside {que});}
//  function void post_randomize;
//  que.push_front(a);
//  if(que.size==6)
//  que.pop_back;
//  $display("a is %0d",a);
//  endfunction
//  endclass
//   cons c;
//  module top;
//  initial
//  begin
//  c=new;
//    repeat(5)
//  c.randomize;
 
//  end
//  endmodule


//  class cons;
//  rand bit [1:0] a;
//  int que[$];
//  constraint x{!(a inside {que});}
//  function void post_randomize();
//  que.push_front(a);
//    if(que.size==3)
//  begin
//  que={};
//  end
// //    $display("a is %0d",$size(a));
//  $display("a is %0d",a);
//  endfunction
//  endclass
//  cons c;
//  module top;
//  initial
//  begin
//  c=new;
//    repeat(20)
//  c.randomize;
 
//  end
//  endmodule


// class packet; 
   
//   rand int a[]; 
//   constraint c1 { a.size == 21; }  
   
//   constraint c2 { 
//     foreach (a[i]) 
//       // If 'i' is even or odd, set 'a[i]' to one-third of 'i' 
//       if (i % 2 == 0 || i % 2 == 1) 
//         a[i] == i / 3; 
//   } 
// endclass 
 
// module test; 
   
//   packet pkt = new; 
   
//   initial begin 
//     pkt.randomize(); 
     
//     // Display the values of array 'a' using '%p' format specifier 
//     $display("a = %p", pkt.a); 
//   end 
// endmodule 

