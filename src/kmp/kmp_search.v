module main

pub fn kmp_run() {
	cp := perform_kmp_search('ababaabbaa', 'abba')
	if cp.len != 0 {
		println('cp ${cp}')
	} else {
		println('not found')
	}
	
}

fn compile_pattern_func(pattern string) []int {
	pattern_length := pattern.len
	mut len := 0
	mut i := 1
	mut compile_pattern_array := []int{len:pattern_length, init:0}
	
	for i < pattern_length {
		if pattern[i] == pattern[len] {
			println('${pattern[i]}, ${pattern[len]}')
			len++
			compile_pattern_array[i] = len
			i++
		} else {
			if len != 0 {
				len = compile_pattern_array[len-1]
			} else {
				compile_pattern_array[i] = len
				i++
			}
		}
	}

	return compile_pattern_array
}

fn perform_kmp_search(text string, pattern string) []int {
	compile_pattern_array := compile_pattern_func(pattern)
	println('pattern ${compile_pattern_array}')
	
	mut text_indx := 0
	mut pattern_indx := 0
	mut found_index := []int{}

	for ;text_indx < text.len; {
		println('1 text_indx ${text_indx}')

		if text[text_indx] == pattern[pattern_indx]{
			pattern_indx++
			text_indx++			
		}
		if pattern_indx == pattern.len {
			
			found_index << (text_indx - pattern_indx)
			println('found_index ${found_index}')
			pattern_indx = compile_pattern_array[pattern_indx-1]
			
		} else if text_indx < text.len && pattern[pattern_indx] != text[text_indx]{
			
			if pattern_indx != 0 {
				pattern_indx = compile_pattern_array[pattern_indx - 1]
			} else {
				text_indx++
			}

		} 
	}
	return found_index
}