require 'gosu'
require_relative '../../lib/shirokuro'

class Window < Gosu::Window
	def initialize width, height
		super(width, height, false)
		self.caption = "SK Physics Example"

		@content = SK::ContentManager.new(self, "../shared/content/", true)
		@manager = SK::GameObjectManager.new

		@cam = SK::Camera.new(SK::Vec2.new(width, height))
		cam = @manager.create("cam")
		cam.add_component(@cam)
		@cam.set_zoom(1.0)

		floor = @manager.create("floor")
		floor.add_component(SK::RigidBody.new())
		floor.add_component(SK::BoxCollider.new(256, 32))
		floor.add_component(SK::ShapeRenderer.new)
		floor.get_component(SK::RigidBody).static = true

		(0..6).each do |i|
			((-i)..(i - 1)).each do |j|
				box = @manager.create("box")
				box.add_component(SK::RigidBody.new)
				box.add_component(SK::BoxCollider.new(6, 6))
				box.add_component(SK::ShapeRenderer.new)
				box.get_component(SK::BoxCollider).restitution = 0.95 # make boxes really bouncy
				box.transform.position.x = j * 8
				box.transform.position.y = -(9*8) + 4 + (i * 8)
			end
		end

		box = @manager.create("large_box")
		box.add_component(SK::RigidBody.new)
		box.add_component(SK::BoxCollider.new(32, 16))
		box.add_component(SK::ShapeRenderer.new)
		box.get_component(SK::RigidBody).mass = 10.0
		box.transform.position.y = -300

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

window = Window.new(512, 512)
window.show