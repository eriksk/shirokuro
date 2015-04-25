module SK
	class Vec2
		attr_accessor :x, :y

		def initialize x = 0.0, y = 0.0
			@x = x
			@y = y
		end

		def + other
			Vec2.new(@x + other.x, @y + other.y)
		end

		def - other
			Vec2.new(@x - other.x, @y - other.y)
		end

		def * other
			if other.is_a?(Numeric)
				return Vec2.new(@x * other, @y * other)
			end
			Vec2.new(@x * other.x, @y * other.y)
		end

		def / other
			if other.is_a?(Numeric)
				return Vec2.new(@x / other, @y / other)
			end
			Vec2.new(@x / other.x, @y / other.y)
		end
	end
end