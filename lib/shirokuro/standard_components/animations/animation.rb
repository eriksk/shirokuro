module SK
	class Animation

		def initialize frames, interval
			@frames = frames
			@interval = interval
			@current = 0.0
			@current_frame = 0
			@on_end = nil
		end

		def frame
			@frames[@current_frame]
		end

		def on_end &block
			@on_end = block
		end

		def reset
			@current = 0.0
			@current_frame = 0
		end

		def update dt
			@current += dt
			if @current > @interval
				@current = 0.0
				@current_frame += 1
				if @current_frame > @frames.size - 1
					unless @on_end == nil
						@on_end.call
					end
					reset
				end
			end
		end
	end
end
