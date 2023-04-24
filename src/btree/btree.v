module main

import math { max }

struct TreeNode {
	value int
	left &TreeNode = unsafe { nil }
	right &TreeNode = unsafe { nil }
}

pub fn run_btree() {
    tree := &TreeNode{
        value: -5
        left: &TreeNode{
            value: 4
            left: &TreeNode{
                value: 3
            }
        }
        right: &TreeNode{
            value: 6
            left: &TreeNode{
                value: 0
            }
        }
    }

    mut result0 := 0
    mut result1 := 0
    unsafe {
        result0 = calculate_max(tree)
        result1 = calculate_max_dfs(tree)
    }
    println('result max ${result0}')
    println('result max summ ${result1}')
}

[unsafe]
fn calculate_max(root &TreeNode) int {	 
	if root == unsafe{ nil }{
		return 0
	}

	l_result, r_result := 0, 0

	unsafe {
		l_result = calculate_max_dfs(root.left)
		r_result = calculate_max_dfs(root.right)
	}
		
	return root.value + math.max(l_result, r_result)	
}

[unsafe]
pub fn calculate_max_dfs(root &TreeNode) int {
	mut maximize := 0
	return unsafe {calculate_max_dsf_help(root, maximize)}
}

[unsafe]
fn calculate_max_dsf_help(root &TreeNode, mx int) int {
	if root == unsafe{ nil }{
		return 0
	}
	mut maximize := mx
	l_result, r_result := 0, 0

	unsafe {
		l_result = calculate_max_dsf_help(root.left, mx)
		r_result = calculate_max_dsf_help(root.right, mx)
	}

	if (root.value + l_result + r_result) > maximize {
		maximize = (root.value + l_result + r_result)
	}

	return maximize
}