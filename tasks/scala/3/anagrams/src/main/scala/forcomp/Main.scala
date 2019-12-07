package forcomp

object Main extends App {
  import Anagrams._

  println(wordOccurrences("hello"))
  println(sentenceOccurrences(List("hello","world")))
  println(wordAnagrams("player"))
  println(combinations(List(('c',1),('o',2))))
  println(subtract(List(('a',2),('b',1)),List(('a',1))))
  println(sentenceAnagrams(List("one","pig")))

  /*Output:
  sbt:funsets> run
  [info] running (fork) forcomp.Main 
  [info] List((e,1), (h,1), (l,2), (o,1))
  [info] List((d,1), (e,1), (h,1), (l,3), (o,2), (r,1), (w,1))
  [info] List(parley, pearly, player, replay)
  [info] List(List(), List((o,1)), List(), List((o,2)), List((c,1)), List((c,1), (o,1)), List((c,1)), List((c,1), (o,2)))
  [info] List((a,1), (b,1))
  [info] List(List(pi, go, en), List(pi, en, go), List(pi, gone), List(nip, ego), List(pin, ego), List(ion, peg), List(go, pi, en), List(go, en, pi), List(go, pine), List(pig, one), List(gin, Poe), List(Poe, gin), List(en, pi, go), List(en, go, pi), List(one, pig), List(pine, go), List(peg, ion), List(ego, nip), List(ego, pin), List(gone, pi), List(pigeon))
  [success] Total time: 1 s, completed 2019-12-7 22:59:58
  */

}
