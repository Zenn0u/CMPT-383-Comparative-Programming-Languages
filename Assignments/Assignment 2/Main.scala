import java.util.Calendar
import java.util.GregorianCalendar

// To Run: divisors(n)
def divisors (num:Int): List[Int] = {
    var div_list:List[Int] = List()
    var i = 0

    for( i <- 2 to (num/2) ) {
        if (num % i == 0) {
            div_list = div_list :+ i
        }
    }

    return div_list
}

// To Run: primes(n)
def primes (num:Int): List[Int] = {
    var tmp_list: List[Int] = List()
    var primes: List[Int] = List()
    var i = 0

    for( i <- 2 to num){
        tmp_list = divisors(i)
        if(tmp_list.isEmpty) {
            primes = primes :+ i
        }
    }

    return primes
}

// To Run: join(str, List(str))
def join (str:String, str_list:List[String]): String = {
    var new_list: String = ""

    for (i <- str_list){
        if(new_list.isEmpty) {
            new_list = i
        }
        else {
            new_list = new_list + str + i
        }
    }

    return new_list
}

// To Run: pythagorean(n)
def pythagorean (num:Int): List[List[Int]] = {
    var rt_list: List[List[Int]] = List()
    var tmp_list: List[Int] = List() 

    var i = 0
    var j = 0
    var z = 0

    for (i <- 1 to num; j <- 1 to num; z <- 1 to num) {
        var sum: Int = (i*i) + (j*j)

        if ((sum == (z*z)) && (i < j)) {
            tmp_list = List(i, j, z)

            if (rt_list.isEmpty) {
                rt_list = List(tmp_list)
            }
            else {
                rt_list = rt_list :+ tmp_list
            }
        }
    }

    return rt_list
}

// To Run: merge(List(n), List(n))
def merge (left: List[Int], right: List[Int]): List[Int] = (left, right) match {
    case (_, Nil) => left
    case (Nil, _) => right
    case (x::xs, y::ys) => 
        if (x < y) { x::merge(xs,right) }
        else { y::merge(left, ys) }
}

// To Run: mergeSort(List(n))
def mergeSort (arr: List[Int]): List[Int] = arr match {
    case Nil => Nil
    case x::Nil => List(x)
    case _ =>
        val (left, right) = arr.splitAt(arr.length/2)
        merge (mergeSort(left), mergeSort(right))
}

// The months start at 0 so it should be tested according to it.
// For example; FromGregorian(2018, 5, 18) == GregorianCalendar(2018, 4, 18)
// To Run: isFriday(GregorianCalendar(n, n, n))
def isFriday (date: GregorianCalendar): Boolean = {
    var bool: Boolean = date.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY
    return bool
}

// To Run: isPrimeDay(GregorianCalendar(n, n, n))
def isPrimeDay (date: GregorianCalendar): Boolean = {
    var bool: Boolean = divisors(date.get(Calendar.DAY_OF_MONTH)) == List()
    return bool
}