class IdGenerator

	def initialize
		@current = 0
	end

	def next
		@current += 1
	end
end