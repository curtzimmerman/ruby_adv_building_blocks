module Enumerable
	def my_each(&code)
		for i in self
			yield(i)
		end
	end

	def my_each_with_index(&code)
		index = 0
		for i in self
			yield i, index
			index += 1
		end
	end

	def my_select(&code)
		selected = []
		for i in self
			if yield(i)
				selected << i
			end
		end
		return selected
	end 

	def my_all?(&code)
		matches_flag = true
		for i in self
			if yield(i) == false
				matches_flag = false
			end
		end
		return matches_flag
	end

	def my_any?(&code)
		matches_flag = false
		for i in self
			if yield(i)
				matches_flag = true
				break
			end
		end
		return matches_flag
	end

	def my_none?(&code)
		matches_flag = true
		for i in self
			if yield(i) == true
				matches_flag = false
				break
			end
		end
		return matches_flag
	end

	def my_count()
		count = 0
		for i in self
			count += 1
		end
		return count
	end

	def my_map(code, &bloc)
		output = []
		for i in self
			temp = i
			temp = yield(i) if block_given?
			output << code.call(temp)
		end
		return output
	end

	def my_inject(num=self[0], &code)
		for i in self
			num = yield(num, i)
		end
		return num
	end

end

def multiply_els(array)
	array.my_inject(1) do |num, i|
		num * i
	end
end


a = [1,2,3,4,5]
output = []

output = a.my_select do |num|
	num == 3
end

puts output.inspect