module SK
	class Matrix

		attr_accessor :values

		def initialize values = []
			@values = values
		end

		def self.identity
			Matrix.new([
				1.0, 0, 0, 0,
				0, 1.0, 0, 0,
				0, 0, 0, 0,
				0, 0, 0, 0
			])
		end

		def self.create_rotation angle
			c = Math::cos(angle)
			s = Math::sin(angle)

			result = Matrix.new([
				+c, +s, 0.0, 0.0,
		        -s, +c, 0.0, 0.0,
		        0.0,  0.0,  1.0, 0.0,
		        0.0,  0.0,  0.0, 1.0
			])
		end

		def self.create_translation(x, y)
			Matrix.new([
				1, 0, 0, 0,
		        0, 1, 0, 0,
		        0, 0, 1, 0,
		        x, y, 0, 1
		    ])
		end

		def self.create_scale x, y
			Matrix.new([
		        x, 0, 0, 0,
		        0, y, 0, 0,
		        0, 0, 1, 0,
		        0, 0, 0, 1
			])
		end

		def decompose
			position = Vec2.new(@values[12], @values[13])
			# tan^-1(2/3) = tan^-1(-1/0)
			rotation = Math::tan(-1.0 * (@values[0] / @values[1]))
			scale = Vec2.new(@values[0], @values[5])
			transform = Transform.new
			transform.position.x = position.x
			transform.position.y = position.y
			transform.rotation = rotation
			transform
		end

		def * (right)
			result = []
			16.times do |i|
				result[i] = 0;
				4.times do |j|
		        	result[i] += @values[i / 4 * 4 + j] * right.values[i % 4 + j * 4]
		        end
			end
		    return Matrix.new(result)
		end
	end
end