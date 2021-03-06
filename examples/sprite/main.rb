require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Sprite Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)

		@manager = SK::GameObjectManager.new

		sprite = @manager.create("sprite")
		sprite.transform.position = SK::Vec2.new(256, 256)
		sprite.transform.scale = SK::Vec2.new(1, 1) * 2.0
		sprite.add_component(SK::SpriteRenderer.new(@content.load_tiles("gfx/character_sprite.png", 32, 32).first))
		sprite.add_component(SK::Rotation.new(0.01))

		sprite.get_component(SK::SpriteRenderer).origin.y = 1.0

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