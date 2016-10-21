module Enumerable
	def my_each
		i = 0 
		while i <self.size
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
		a = []
		self.my_each do |i|
			if yield(i) == true
				a.push(i)
			end


		end
		return a
	end

	def my_all?
		val = true
		if block_given? == true
			self.my_each do |i|
				if yield(i) == false
					val = false
				end
			end
		else
			self.my_each do |i|
				if i == nil || false
					val = false
				end
			end
		end
		if val == true
			return true
		else
			return false
		end
	end

	def my_none?
		val = true
		if block_given? == true
			self.my_each do |i|
				if yield(i) == true
					val = false
				end
			end
		else
			self.my_each do |i|
				if i == true
					val = false
				end
			end
		end
		if val == true
			return true
		else
			return false
		end
	end

	def my_count(num= nil)
		count = 0
		if block_given? == true
			self.my_each do |i|
				if yield(i) == true
					count += 1
				end
			end
		elsif num == nil
			count = self.length
		else
			self.my_each do |i|
				if num == i
					count += 1
				end
			end
		end
		return count
	end


	def my_map(&block)
		a = []
		self.my_each do |i|
			a.push(block.call(i))
		end
		return a
	end

	def my_inject
		i = 1
		result = self[0]
		while i < self.size
			result = yield(result, self[i])
			i += 1
		end
		return result
		
	end
end