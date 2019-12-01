import scala.collection.mutable.ListBuffer

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println(balance("(()(asd))((x)())".toList)) // true
    println(balance("(()(asd)((x)())".toList)) // false

    println(countChange(5, List(3, 2))) // 1
    println(countChange(8, List(3, 2))) // 2
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == 0) 1
    else pascal(c - 1, r - 1) + pascal(c - 1, r)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {

    @scala.annotation.tailrec
    def balanceInternal(chars: List[Char], numOpens: Int): Boolean = {
      if (chars.isEmpty) {
        numOpens == 0
      } else {
        val currentCharacter = chars.head
        val n = currentCharacter match {
          case '(' => numOpens + 1
          case ')' => numOpens - 1
          case _ => numOpens
        }
        if (n >= 0) balanceInternal(chars.tail, n)
        else false
      }
    }

    balanceInternal(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {

    @scala.annotation.tailrec
    def countChangeInternal(coinsPairs: List[(Int, Int)], count: Int): Int = {
      if (coinsPairs.isEmpty) {
        count
      } else {
        val newCoinsPairs = ListBuffer[(Int, Int)]()
        var newCount = count
        for ((lastMaxCoin, total) <- coinsPairs) {
          if (total < money) {
            for (c <- coins) {
              if (c >= lastMaxCoin) {
                val e = (c, total + c)
                newCoinsPairs += e
              }
            }
          } else if (total == money) {
            newCount += 1
          }
        }

        countChangeInternal(newCoinsPairs.toList, newCount)
      }
    }

    val coinsPairs = coins.map { c => (c, c) }
    countChangeInternal(coinsPairs, 0)
  }
}
