package recfun
//import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row) 
        print(pascal(col, row) + " ")
      println()
    }
    println("Balancing")
    println("Checking \"()()(())\" sequence")
    println(balance("()()(())".toList))
    println("Balancing")
    println("Checking \"()()(()\" sequence")
    println(balance("()()(()".toList))
    println("Balancing")
    println("Checking \"())\" sequence")
    println(balance("())".toList))
  
    println("Counting change")
    val l = List(1,2,3,5,10)
    println(countChange(10, l))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    return if (c >= 0  && r > 0 && c <= r) {
      pascal(c - 1, r - 1) + pascal(c, r - 1)
    } else {
      if (c == r && c == 0) {
        1
      } else {
        0
      }
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    var opened = 0
    chars.foreach((c: Char) => {
      if (c == '(') {
        opened += 1
      } else {
        opened -= 1
      }
      if (opened < 0) {
        return false
      }
    })
    return if (opened > 0) false else true
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    return if (coins.isEmpty) {
      0
    } else if (money - coins.head == 0) {
      1
    } else if (money - coins.head < 0) {
      0
    } else {
      countChange(money - coins.head, coins) + countChange(money, coins.tail)
    }
  }
}
