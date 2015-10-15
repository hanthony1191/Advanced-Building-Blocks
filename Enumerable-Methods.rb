module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end
	
	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		self
	end
	
	def my_select
		i = 0
		result = []
		while i < self.size
			if yield(self[i])
			result.push(self[i])
			i+=1
		end
		return result
	end
	
	def my_all?
		i = 0
		answer = true
		while i < self.size
			unless block_given?
				if self[i] == false
					answer = false
				end
			elsif yield(self[i]) == false
				answer = false
			end
			i+=1
		end
		return answer
	end
	
	def my_any?
		i = 0
		answer = false
		while i < self.size
			unless block_given?
				if self[i] == true
					answer = true
				end
			elsif yield(self[i]) == true
				answer = true
			end
			i+=1
		end
		return answer
	end
	
	def my_none?
		if my_any?
			return false
		else
			return true
		end
	end
	
	def my_count(arg)
		i = 0
		answer = 0
		while i < self.size
			if arg == nil and block_given? == false
				answer += 1
			elsif arg == self[i]
				answer += 1
			elsif yield(self[i]) == true
				answer += 1
			end
			i+=1
		end
		return answer
	end
				
	def my_map1
		i = 0
		result = []
		while i < self.size
			result.push(yield(self[i])
			i+=1
		end
		return result
	end
	
	def my_map2(&my_proc)
		i = 0
		result = []
		while i < self.size
			result.push(my_proc.call(self[i]))
			i+=1
		end
		return result
	end
	
	def my_map3(&my_proc)
		i = 0
		result = []
		while i < self.size
			if block_given? and my_proc != nil
				result.push(my_proc.call(self[i]))
				result.push(yield(self[i]))
			end
			i+=1
		end
		return result
	end
	
	def my_inject(default)
		i = 0
		result = default
		while i < self.size
			yield(result, self[i])
			i+=1
		end
		return result
	end
	
	def multiply_els(array)
		array.my_inject(1) {|product| product * num}
	end
	
end