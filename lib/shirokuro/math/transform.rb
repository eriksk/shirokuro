module SK
	class Transform

		attr_accessor :position, :rotation, :scale

		def initialize
			@position = Vec2.new
			@scale = Vec2.new(1.0, 1.0)
			@rotation = 0.0		
		end

#		def matrix
#			Matrix.new(4, 4)
#		end
	end
end