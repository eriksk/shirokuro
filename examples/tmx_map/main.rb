require 'gosu'
require_relative '../../lib/shirokuro'
require 'json'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Sprite Animation Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)
		@manager = SK::GameObjectManager.new

		map = @manager.create("map")

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
		delta = 16.0 #fake it

		@manager.update delta
	end

	def draw
		@manager.draw self
	end
end

window = Window.new(512, 512)
window.show