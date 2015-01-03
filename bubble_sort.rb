
def bubble_sort(array)
	swapped = true
	while swapped == true
		swapped = false
		for i in 0...array.length-1 do
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end
	end
	return array
end

a = bubble_sort([4,3,78,2,0,2])	
puts a.inspect

def bubble_sort_by(array=[], &code)
	swapped = true
	while swapped == true
		swapped = false
		for i in 0...array.length-1 do
			order = code.call(array[i], array[i+1])
			if order < 0
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end
	end
	return array
end

a = bubble_sort_by ["hi", "reallylongwords", "longstuff", "morethan", "an", "i", "sleep", "random", "hello","hey", "iterate", "testing", "length", "longword", "3"] do |left,right|
	right.length - left.length
end

puts a.inspect