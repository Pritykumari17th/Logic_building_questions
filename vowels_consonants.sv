/*Write a code to create a function that accepts English alphabets as characters
 and determines whether it is a vowel or a consonant

Also implement this checking for the entire English alphabets.*/


typedef enum{a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}alphabets;

class pkt;
  
  randc alphabets alpha;
  
  string vowel[$];
  string consonent[$];

  function void vov_con(alphabets alpha);   
    $display("vowels are :- ");
    foreach(vowel[i])begin
      $write("%s, ", vowel[i]);
    end
    
    $display("\nconsonent are :- ");
    foreach(consonent[i])begin
      $write("%s, ", consonent[i]);
    end
    
  endfunction
  
  function void post_randomize();

    if(alpha == a || alpha == e || alpha == i|| alpha == o|| alpha == u)
      vowel.push_front(alpha.name);
    else
      consonent.push_front(alpha.name);
    
    
  endfunction
endclass

module tb;
  
  initial begin
    pkt p;
    p = new();
    
    repeat(26)
    p.randomize();
    p.vov_con(p.alpha);
  end
endmodule
