module SK
	class Camera < Component

		attr_accessor :speed

		def initialize screen_size
			@screen_size = screen_size / 2.0
			@target = Vec2.new
			@speed = 0.05
		end

		def x
			-transform.position.x + (@screen_size.x / 2.0)
		end

		def y
			-transform.position.y + (@screen_size.y / 2.0)
		end
		
		def move x, y
			@target.x = x
			@target.y = y
		end

		def move_by x, y
			@target.x += x
			@target.y += y
		end

		def zoom_by factor
			transform.scale += factor
		end

		def set_zoom zoom
			transform.scale.x = zoom
			transform.scale.y = zoom
		end

		def lerp x, y, w
			x + (y - x) * w
		end

		def update dt
			# TODO: apply delta to smooth movement
			transform.position.x = lerp(transform.position.x, @target.x, @speed)
			transform.position.y = lerp(transform.position.y, @target.y, @speed)
		end

		def view window, &block
			window.translate(@screen_size.x, @screen_size.y) do
				window.scale(transform.scale.x, transform.scale.y) do		
					window.translate(-transform.position.x, -transform.position.y) do
						block.call()
					end
				end
			end
		end
	end
end