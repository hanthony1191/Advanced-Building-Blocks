def bubble_sort(array)
	iterate = false
	array[0...-1].each_with_index do|num, index|
		if array[index] > array[index + 1]
			array[index + 1], array[index] = array[index], array[index + 1]
			iterate = true
		end
	end
	bubble_sort(array) if iterate
	return array
end