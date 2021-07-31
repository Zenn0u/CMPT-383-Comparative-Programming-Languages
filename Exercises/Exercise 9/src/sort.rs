// use rand::Rng;

// const INSERTION_SORT_CUTOFF: usize = 0;

// /// Sort v[left..=right] in-place with insertion sort.
// pub fn insertion_sort<T: Copy + Ord>(v: &mut Vec<T>, left: usize, right: usize) {
//     for i in (left + 1)..=right {
//         let x = v[i];
//         let mut j = i;
//         while j >= left + 1 && v[j - 1] > x {
//             v[j] = v[j - 1];
//             j -= 1;
//         }
//         v[j] = x;
//     }
// }

// /// Partition v[left..=right] around a random pivot, in-place. Returns the position of the pivot.
// /// i.e. after "let p = partition(v, left, right)", everything in v[left..p] is <= v[p] and
// /// everything in v[p+1..=right] is >= v[p].
// pub fn partition<T: Copy + Ord>(v: &mut Vec<T>, left: usize, right: usize) -> usize {
//     let mut temp: T;

//     // Choose random pivot
//     let mut rng = rand::thread_rng();
//     let pivot_index: usize = rng.gen_range(left..=right);
//     let pivot = v[pivot_index];

//     // Move pivot at the end of the range to match standard Lumuto algorithm
//     temp = v[pivot_index];
//     v[pivot_index] = v[right];
//     v[right] = temp;

//     // Move smaller elements before the pivot
//     let mut pos = left;
//     for i in left..right {
//         if v[i] < pivot {
//             temp = v[pos];
//             v[pos] = v[i];
//             v[i] = temp;
//             pos += 1;
//         }
//     }

//     // Put pivot into position
//     temp = v[right];
//     v[right] = v[pos];
//     v[pos] = temp;

//     pos
// }

pub fn quicksort_partial<T: Copy + Ord>(v: &mut [T], left: usize, right: usize) -> usize {
    let mut temp: T;
    let pivot = v[right];
    let mut index = left;

    for i in left..right {
        if v[i] < pivot {
            temp = v[index];
            v[index] = v[i];
            v[i] = temp;
            index += 1;
        }
    }

    temp = v[right];
    v[right] = v[index];
    v[index] = temp;

    return index;
}

pub fn quicksort<T: Copy + Ord>(v: &mut [T]){
    let left: usize = 0;
    let mut right: usize = v.len();
    
    if right != 0 {
        right -= 1;
    }

    if left >= right{
        return;
    }

    let mut pivot = quicksort_partial(v, left, right);
    quicksort(&mut v[left..=pivot-1]);
    quicksort(&mut v[pivot+1..=right]);
}