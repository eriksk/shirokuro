require 'gosu'
require_relative '../../lib/shirokuro'
require 'json'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Sprite Animation Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)
		@manager = SK::GameObjectManager.new

		@cam = SK::Camera.new(SK::Vec2.new(width, height))
		cam = @manager.create("cam")
		cam.add_component(@cam)
		@cam.set_zoom(2.0)

		map = @manager.create("map")
		map.transform.position.x -= 256
		map.transform.position.y -= 256

		tmx_map = SK::TMX::Map.new(JSON.load(File.open("#{@content.content_root}maps/stage2.json").read))
		map.add_component(SK::MapComponent.new(tmx_map))
		map.add_component(SK::MapRenderer.new(@content.load_tiles("gfx/tileset.png", 32, 32)))
		
		@manager.start
	end

	def button_down(id)
		case id
		when Gosu::KbEscape
			self.close
		end
	end

	def update
		dt = 16.0 #fake it

		if button_down?(Gosu::KbLeft)
			@cam.move_by(-1.0 * dt, 0)
		end
		if button_down?(Gosu::KbRight)
			@cam.move_by(1.0 * dt, 0)
		end
		if button_down?(Gosu::KbUp)
			@cam.move_by(0, -1.0 * dt)
		end
		if button_down?(Gosu::KbDown)
			@cam.move_by(0, 1.0 * dt)
		end

		if button_down?(Gosu::KbW) 
			@cam.zoom_by(0.01)
		end
		if button_down?(Gosu::KbS) 
			@cam.zoom_by(-0.01)
		end

		@manager.update dt
	end

	def draw
		@cam.view(self) do
			@manager.draw self
		end
	end
end

window = Window.new(1024, 1024)
window.show