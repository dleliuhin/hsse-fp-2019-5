object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(balance(List(')', '(', '(', ')', ')', '(')))
    println(countChange(13, List(5, 3, 2)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (r == 0 || c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    chars.count(_ == '(') == chars.count(_ == ')')
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {

    def countNumVariants(currentSum: Int, coinIndex: Int): Int = {
      var numVariants : Int = 0
      if (currentSum == money) return 1
      if (currentSum > money) return 0
      for (i <- 0 to coins.size - 1) {
        if (i >= coinIndex)
          numVariants += countNumVariants(currentSum + coins.apply(i), i)
      }
      return numVariants
    }

    countNumVariants(0, 0)
  }
}
