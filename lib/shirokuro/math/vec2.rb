module Shirokuro
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
			Vec2.new(@x * other.x, @y * other.y)
		end

		def *(scalar)
			Vec2.new(@x * scalar, @y * scalar)
		end

		def / other
			Vec2.new(@x / other.x, @y / other.y)
		end
	end
end