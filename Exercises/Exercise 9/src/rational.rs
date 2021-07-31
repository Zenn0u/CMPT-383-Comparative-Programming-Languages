use std::fmt;
use fmt::Display;

fn gcd(a: i64, b: i64) -> i64 {
    if b == 0 {
        return a;
    }
    else {
        return gcd(b, a % b)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct Rational {
    pub n: i64,
    pub d: i64,
}

impl Rational {
    pub fn new(n: i64, d: i64) -> Rational {
        Rational {
            n: n,
            d: d,
        }
    }

    pub fn reduce(&mut self) {
        let x = gcd(self.n, self.d);
        self.n /= x;
        self.d /= x;
    }
}

impl From<i64> for Rational {
    fn from(n: i64) -> Rational {
        Rational {
            n: n,
            d: 1,
        }
    }
}

impl From<Rational> for f64 {
    fn from(f: Rational) -> f64 {
        let x = f.n as f64 / f.d as f64;
        return x;
    }
}