require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Sprite Example"

		@manager = SK::GameObjectManager.new
	end

	def button_down(id)
		case id
		when Gosu::KbEscape
			self.close
		end
	end

	def update
		
	end

	def draw
		
	end
end

window = Window.new(512, 512)
window.show