// https://doc.rust-lang.org/book/ch06-02-match.html
// https://doc.rust-lang.org/rust-by-example/std_misc/file/open.html
// https://doc.rust-lang.org/rust-by-example/error/result.html
// https://doc.rust-lang.org/std/convert/trait.From.html

use std::fs::File;
use std::io::{BufReader, Read};
use std::fmt;

#[derive(Debug, Clone)]
pub struct SummationError {
    msg: String,
}

impl std::error::Error for SummationError {}
impl fmt::Display for SummationError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.msg)
    }
}
impl From<std::io::Error> for SummationError {
    fn from(e: std::io::Error) -> SummationError {
        SummationError {
            msg: format!("io::Error: {}", e),
        }
    }
}
impl From<std::num::ParseIntError> for SummationError {
    fn from(e: std::num::ParseIntError) -> SummationError {
        SummationError {
            msg: format!("ParseIntError: {}", e),
        }
    }
}


pub fn sum_file_1 (filename: &std::path::Path) -> Result<i64, SummationError> {
    let file = match File::open(filename) {
        Ok(file) => file,
        Err(e) => return Err(SummationError::from(e)),
    };

    let mut data = String::new();
    let mut br = BufReader::new(file);

    match br.read_to_string(&mut data) {
        Err(e) => return Err(SummationError::from(e)),
        Ok(_) => {    
            let mut v: Vec<&str> = data.split('\n').collect();
            v.retain(|&x| x != "");
            let mut sum: i64 = 0;

            for i in v {
                let k = match i.parse::<i64>() {
                    Ok(k) => k,
                    Err(e) => return Err(SummationError::from(e)),
                };

                sum += k;
            }

            return Ok(sum);
        }
    }
}

pub fn sum_file_2 (filename: &std::path::Path) -> Result<i64, SummationError> {
    let file = File::open(filename)?;
    let mut data = String::new();
    let mut br = BufReader::new(file);

    br.read_to_string(&mut data)?;
    let mut v: Vec<&str> = data.split('\n').collect();
    v.retain(|&x| x != "");

    let mut sum: i64 = 0;
    for i in v {
        let k = match i.parse::<i64>() {
            Ok(k) => k,
            Err(e) => return Err(SummationError::from(e)),
        };
        sum += k;
    }

    return Ok(sum);
}