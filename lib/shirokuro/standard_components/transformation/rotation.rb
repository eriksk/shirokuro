module SK
	class Rotation < Component

		attr_accessor :rotation

		def initialize rotation
			@rotation = rotation
		end
		
		def update dt
			transform.rotation += @rotation * dt
		end
	end
end