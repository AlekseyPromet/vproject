module main

fn main() {
    arr := [1,3,5,7,9,11]
    bs := binary_search(arr, 11)
    println('bs: ${bs}')

    kmp_run()
}
