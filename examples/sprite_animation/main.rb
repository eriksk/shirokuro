require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Sprite Animation Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)

		@manager = SK::GameObjectManager.new

		sprite = @manager.create("sprite")
		sprite.transform.position = SK::Vec2.new(256, 256)
		sprite.transform.scale = SK::Vec2.new(1, 1) * 6.0
		
		sprite.add_component(SK::AnimationComponent.new({
			:idle => SK::Animation.new([0, 1, 2, 3, 4], 100)
			}))
		sprite.add_component(SK::AnimationSpriteRenderer.new(@content.load_tiles("gfx/character_sprite.png", 32, 32)))
		#sprite.add_component(SK::Rotation.new(0.01))

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