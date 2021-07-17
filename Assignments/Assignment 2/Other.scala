import scala.util.Random
import java.util.Calendar

/////////////////////////// Being able to use Java Libraries

// To Run: java_calendar()
def java_calendar() = {
    val date: Calendar = Calendar.getInstance()
    println("Today is " + date.get(Calendar.DATE) + "th.")
}

/////////////////////////// Pattern Matching

// To Run: pmRandom()
def pmRandom(): String = {
    val x: Int = Random.nextInt(20)

    x match {
        case 0 => "zero"
        case 1 => "one"
        case 2 => "two"
        case 3 => "three"
        case 4 => "four"
        case 5 => "five"
        case 6 => "six"
        case 7 => "seven"
        case 8 => "eight"
        case 9 => "nine"
        case _ => "huh?"
    }
}

/////////////////////////// Lazy Evaluation

// Include a function just in case but I think it would be better to run a code yourself in the terminal
// For Example; val a = 1 + 1 and lazy val b = 1 + 1, that way you can observe b is not calculated but a is 

// To Run: test_lazy()
def test_lazy() = {
    val a = 6
    val b = List(1,2,3)

    val output1 = a + b(1)
    lazy val output2 = a + b(2)

    println(output1)
    println(output2)
}

/////////////////////////// Currying

// To Run: add(n, n)
def add(a:Int, b:Int): Int = {
    return a + b
}

// To Run: add (n) (n)
def curryAdd(a: Int)(b: Int): Int = {
    return a + b
}

/////////////////////////// Operator Overloading

case class myInt(a: Int) {
    def +(b: Int): Int = { return a * b}
}

// To Run: test_oo(n)
def test_oo(n: Int) = {
    var a: myInt = myInt(n);
    println("This prints the number " + n + " times 4: " + (a+4) + " using operator \"+\" ")
}

/////////////////////////// Type Inference

// To Run: tinf_test()
def tinf_test() = {
    val a = 1
    val b = 1.5
    val c = "abc"

    println("Class of " + a + " is " + a.getClass)
    println("Class of " + b + " is " + b.getClass)
    println("Class of " + c + " is " + c.getClass)
}

/////////////////////////// Singleton Objects

// To Run: singleMain.printer()
object singleMain {
    var a  = "This is a string within Singleton Object singleMain"
    def printer() = {
        println(a)
    }
}