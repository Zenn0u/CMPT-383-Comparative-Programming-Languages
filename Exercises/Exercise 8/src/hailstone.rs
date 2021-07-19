pub fn hailstone(n: u64) -> u64 {
    if n % 2 == 0 {
        return n/2;
    }

    else {
        return (3*n)+1;
    }
}

// hailstone_sequence_append_7 = time:   [391.05 ns 394.74 ns 399.34 ns]
// hailstone_sequence_append_162964 = time:   [535.04 ns 538.31 ns 541.87 ns]
// hailstone_sequence_append_686901248 = time:   [1.3812 us 1.3871 us 1.3933 us]
pub fn hailstone_sequence_append(n: u64) -> Vec<u64> {
    let mut seq: Vec<u64> = Vec::new();
    let mut res: u64 = n;
    seq.push(res);

    while res != 1 {
        res = hailstone(res);
        seq.push(res);
    }

    return seq;
}


// hailstone_sequence_prealloc_7 = time:   [217.29 ns 218.35 ns 219.54 ns]
// hailstone_sequence_prealloc_162964 = time:   [295.37 ns 304.51 ns 315.19 ns]
// hailstone_sequence_prealloc_686901248 = time:   [1.0341 us 1.0371 us 1.0406 us]
pub fn hailstone_sequence_prealloc(n: u64) -> Vec<u64> {
    let mut iter: usize = 0;
    let mut tmp: u64 = n;
    let size: usize = loop {
        iter += 1;
        tmp = hailstone(tmp);
        if tmp == 1{
            break iter;
        }
    };

    let mut seq: Vec<u64> = Vec::with_capacity(size);
    tmp = n;
    seq.push(tmp);
    while tmp != 1 {
        tmp = hailstone(tmp);
        seq.push(tmp);
    }

    return seq;
}