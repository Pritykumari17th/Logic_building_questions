 // string palindrome :- madam


module tb;
  
  string word;
  
//using for loop
  
/*  function void palindrome_checker(string word);
   int size;
   size  = word.len();
    for(int i = 0; i <= size / 2; i++)begin
        if(word[i]!= word[size-1])begin
          $display("%0s is a NOT a palindrome",word);
//           $display("%0d",size);
      return;
        end
      size--;
      end
    $display("%0s is a palindrome",word);             
  endfunction*/
  
  
  //using while loop
  
     function automatic void palindrome_checker(string word);
   int size,i=0;
      size  = word.len()-1;
      
      while(i<size)begin
        
        if(word[i] != word[size])begin
            $display("%0s is a NOT a palindrome",word);
      return;
        end
      size--;
        i++;
      end
    $display("%0s is a palindrome",word);             
// 		i=0;
  endfunction
  
  initial begin
    
//     word = "madam";
    palindrome_checker("madam");
    palindrome_checker("hello");
    palindrome_checker("adda");
    palindrome_checker("racecar");
    palindrome_checker("abcdefghijklmopqpomlkjihgfedcba");
    palindrome_checker("12321");
    palindrome_checker("veyev");
  end
endmodule


