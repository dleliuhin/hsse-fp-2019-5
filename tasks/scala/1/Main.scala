package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle:")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Balancing:")
    println(balance("()()))".toList))
    println(balance("()".toList))
    println("Count change:")
    val l = List(1,2,3,5,9,11)
    println(countChange(11, l))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || с == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    if (chars.isEmpty)
      count == 0
    else if (chars.head == '(')
      balance(chars.tail, count + 1)
    else if (chars.head == ')' && count > 0)
      balance(chars.tail, count - 1)
    else
      balance(chars.tail, count)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (coins.isEmpty || (money - coins.head < 0)) 0
    else if (money - coins.head == 0) 1
    else countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
}
