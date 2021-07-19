pub fn find_elt<T: Eq>(values: &Vec<T>, elt: T) -> Option<usize> {
    let pos: Option<usize> = values.iter().position(|tmp| *tmp == elt);
    return pos;
}