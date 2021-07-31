// Benchmark Results
//  any_shape_zero_area     time:   [60.171 us 62.719 us 65.121 us] Found 2 outliers among 100 measurements (2.00%) 2 (2.00%) high mild
//  any_circle_zero_area    time:   [25.636 us 26.975 us 28.620 us] Found 9 outliers among 100 measurements (9.00%) 5 (5.00%) high mild 4 (4.00%) high severe
//  any_rectangle_zero_area time:   [30.683 us 33.079 us 35.897 us] Found 7 outliers among 100 measurements (7.00%) 7 (7.00%) high mild

use rand::Rng;

pub trait Shape {
    fn area(&self) -> f64;
    fn description(&self) -> &str; // used to inspect types during testing
}

#[derive(Debug, Clone)]
pub struct Circle {
    radius: f64,
}
impl Circle {
    pub fn new(radius: f64) -> Circle {
        Circle { radius }
    }
    pub fn random() -> Circle {
        Circle {
            radius: rand::random::<f64>() + 1.0,
        }
    }
}
impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius.powi(2)
    }
    fn description(&self) -> &str {
        "circle"
    }
}

#[derive(Debug, Clone)]
pub struct Rectangle {
    width: f64,
    height: f64,
}
impl Rectangle {
    pub fn new(width: f64, height: f64) -> Rectangle {
        Rectangle { width, height }
    }
    pub fn random() -> Rectangle {
        Rectangle {
            width: rand::random::<f64>() + 1.0,
            height: rand::random::<f64>() + 1.0,
        }
    }
}
impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
    fn description(&self) -> &str {
        "rectangle"
    }
}

pub fn any_circle_zero_area(shapes: &Vec<Box<Circle>>) -> bool {
    for i in shapes.iter(){
        if i.area() == 0.0 {
            return true;
        }
    }
    return false;
}

pub fn any_rectangle_zero_area(shapes: &Vec<Box<Rectangle>>) -> bool {
    for i in shapes.iter(){
        if i.area() == 0.0 {
            return true;
        }
    }
    return false;
}

pub fn any_shape_zero_area(shapes: &Vec<Box<dyn Shape>>) -> bool {
    for i in shapes.iter(){
        if i.area() == 0.0 {
            return true;
        }
    }
    return false;
}

// generate 2*n Circles
pub fn make_circle_vec(n: usize) -> Vec<Box<Circle>> {
    let mut cv: Vec<Box<Circle>> = Vec::new();
    for _i in 0..(2*n){
        cv.push(Box::new(Circle::random()));
    }
    return cv;
}

// generate 2*n Rectangles
pub fn make_rectangle_vec(n: usize) -> Vec<Box<Rectangle>> {
    let mut rv: Vec<Box<Rectangle>> = Vec::new();
    for _i in 0..(2*n){
        rv.push(Box::new(Rectangle::random()));
    }
    return rv;
}

// generate n Circles and n Rectangles
pub fn make_mixed_vec(n: usize) -> Vec<Box<dyn Shape>> {
    let mut dy: Vec<Box<dyn Shape>> = Vec::new();
    for _i in 0..n{
        dy.push(Box::new(Rectangle::random()));
    }
    for _i in 0..n{
        dy.push(Box::new(Circle::random()));
    }
    return dy;
}