require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Layer and Order sorting Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)

		@manager = SK::GameObjectManager.new

		sprite1 = @manager.create("sprite")
		sprite1.transform.position = SK::Vec2.new(256, 256)
		sprite1.transform.scale = SK::Vec2.new(1, 1) * 2.0
		renderer1 = SK::SpriteRenderer.new(@content.load_tiles("gfx/character_sprite.png", 32, 32).first)
		renderer1.layer = 0
		renderer1.order_in_layer = 0
		sprite1.add_component(renderer1)
		sprite1.get_component(SK::SpriteRenderer).origin.y = 1.0

		sprite2 = @manager.create("sprite")
		sprite2.transform.position = SK::Vec2.new(266, 256)
		sprite2.transform.scale = SK::Vec2.new(1, 1) * 2.0
		renderer2 = SK::SpriteRenderer.new(@content.load_tiles("gfx/character_sprite.png", 32, 32).first)
		renderer2.layer = 0
		renderer2.order_in_layer = -1 # behind the other
		sprite2.add_component(renderer2)
		sprite2.get_component(SK::SpriteRenderer).origin.y = 1.0


		bg = @manager.create("sprite")
		bg.transform.position = SK::Vec2.new(266, 256)
		bg.transform.scale = SK::Vec2.new(1, 1) * 12.0
		renderer3 = SK::SpriteRenderer.new(@content.load_tiles("gfx/character_sprite.png", 32, 32).first)
		renderer3.layer = -1 # background
		renderer3.order_in_layer = 0
		bg.add_component(renderer3)

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