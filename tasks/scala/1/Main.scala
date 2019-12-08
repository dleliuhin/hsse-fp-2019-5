package recfun
import scala.collection.mutable.ListBuffer

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
      }
	   println(balance("(()(asd))((x)())".toList))
       println(balance("(()(asd)((x)())".toList)) 
       println(countChange(10, List(5,2,1)))
      }

   /*Exercise 1*/
  
  def pascal(c: Int, r: Int): Int = {
   if (c == 0 || c == r) 1
   else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }
 
  /*Exercise 2 Parentheses Balancing*/
  
def balance(chars: List[Char]): Boolean = {
    def f(chars: List[Char], numOpens: Int): Boolean = {
      if (chars.isEmpty) {numOpens == 0} 
	  else 
	  {val h = chars.head
       val n =
          if (h == '(') numOpens + 1
          else if (h == ')') numOpens - 1
          else numOpens
        if (n >= 0) f(chars.tail, n)
        else false
      }
    }
    f(chars, 0)
  }

  /* Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation 2 and 3: 2+3.*/
  
  def countChange(m: Int, coins: List[Int]): Int = {
    def change(m: Int, coins: List[Int]): Int = {
      if (m < 0 || coins.isEmpty) 0
      else if (m == 0) 1
      else change(m, coins.tail) + change(m - coins.head, coins)
    }
    change(m, coins)
  }
}

/*
Pascal's Triangle
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1
1 7 21 35 35 21 7 1
1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
1 10 45 120 210 252 210 120 45 10 1
true
false
10
*/