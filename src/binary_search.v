module main

pub fn binary_search(arr []int, target int) int {
	mut first_indx := 0
	mut last_indx := arr.len - 1

	mut mid_indx := (first_indx + last_indx) / 2
	
	for first_indx <= last_indx {
		mid_indx = (first_indx + last_indx) / 2

		if arr[mid_indx] == target {
			return mid_indx
		} else if arr[mid_indx] < target {
			first_indx = mid_indx +1
		} else if arr[mid_indx] > target {
			last_indx = mid_indx - 1
		}
	}

	return -1
}