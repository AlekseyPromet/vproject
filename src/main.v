module main

import math { sqrt }

fn main() {
    js := jump_search([1,2,3,4,5,7], 7)
    println('jump_search ${js}')
}

fn jump_search(integers []int, elem int) int {

    arr_len := integers.len
    mut jump_steps := int(math.sqrt(arr_len))
    mut prev_step := 0 
    

    for integers[math.min(jump_steps, arr_len)-1] < elem {
        println('${jump_steps}')           
        prev_step = jump_steps
        jump_steps += int(math.sqrt(arr_len))
        if prev_step >= arr_len {
            return -1
        }
    }
    for integers[prev_step] < elem {
        println('${jump_steps}')   
        prev_step++
        if prev_step == math.min(jump_steps, arr_len) {
            return -1
        }
    }
    if integers[prev_step] == elem {
        return prev_step
    }    

    return -1
}