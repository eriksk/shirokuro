module SK
	class AnimationComponent < Component
		
		attr_accessor :animations, :current

		def initialize animations
			@animations = animations
			@current = animations.keys.first
		end

		def set name
			if name == @current
				return
			end
			@current = name
			@animations[@current].reset
		end

		def frame
			@animations[@current].frame
		end
		
		def update dt
			@animations[@current].update dt
		end
		
	end
end