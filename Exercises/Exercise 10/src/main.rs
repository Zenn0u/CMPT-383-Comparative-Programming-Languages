mod dynamic;
mod files;

use files::SummationError;
use std::path::Path;

use dynamic::make_circle_vec;
use dynamic::make_rectangle_vec;
use dynamic::any_circle_zero_area;
use dynamic::Circle;
use dynamic::any_rectangle_zero_area;

fn test_each_file(sum_file: fn(&Path) -> Result<i64, SummationError>) {
    println!("Success: {:?}", sum_file(Path::new("good.txt")));
    println!(
        "No such file or directory: {:?}",
        sum_file(Path::new("missing_file.txt"))
    );
    println!(
        "Did not contain valid UTF-8: {:?}",
        sum_file(Path::new("bad_utf8.txt"))
    );
    println!(
        "Invalid digit found: {:?}",
        sum_file(Path::new("bad_number.txt"))
    );
}

fn main() {
    test_each_file(files::sum_file_1);
    test_each_file(files::sum_file_2);

    let mut c = make_circle_vec(2);
    c.push(Box::new(Circle::new(0.0)));
    println!("{:?}",c);
    let r = make_rectangle_vec(2);
    println!("{:?}",r);
    println!("{}", any_circle_zero_area(&c));
    println!("{}", any_rectangle_zero_area(&r));
}
