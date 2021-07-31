#[cfg(test)]
use crate::rational::Rational;

#[test]
fn rational_test() {
    let mut r = Rational::new(6, 8);
    assert_eq!(format!("{:?}", r), "Rational { n: 6, d: 8 }");
    r.reduce();
    let four1 = Rational::from(4);
    let four2 = Rational::new(4, 1);
    assert_eq!(four1, four2);
    let f = f64::from(r);
    let tf: f64 = 6 as f64/8 as f64;
    assert_eq!(f,tf);
}