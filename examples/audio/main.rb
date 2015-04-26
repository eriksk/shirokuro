require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Audio Example"

		@audio = SK::AudioManager.new(self, "../shared/content/audio")

		@audio.register_song("song_1")
		@audio.register_sound("boing")
		@audio.load

		@audio.play_song "song_1"

	end

	def button_down(id)
		case id
		when Gosu::KbEscape
			self.close
		when Gosu::KbSpace
			@audio.play "boing"
		end
	end

	def update
		dt = 16.0 #fake it

		# cleans up audio
		@audio.update dt
	end

	def draw
	end
end

window = Window.new(512, 512)
window.show