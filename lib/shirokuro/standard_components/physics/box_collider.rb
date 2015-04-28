module SK
	class BoxCollider < Component

		attr_accessor :width, :height, :friction, :restitution, :shape, :offset, :category, :collides_with

		def initialize width, height
			super()
			@width = width
			@height = height
			@friction = 0.4
			@restitution = 0.1
			@offset = CP::Vec2.new(0, 0)
			@category = 0
			@collides_with = 0
		end

		def start
			rigid_body = get_component(RigidBody)

			if rigid_body == nil
				raise "RigidBody required for BoxCollider"
			end

			half_width = @width / 2.0
			half_height = @height / 2.0

			vertices = [
				CP::Vec2.new(-half_width, -half_height),
				CP::Vec2.new(-half_width, half_height),
				CP::Vec2.new(half_width, half_height),
				CP::Vec2.new(half_width, -half_height)
			]

			@shape = CP::Shape::Poly.new(rigid_body.body, vertices, @offset)
			@shape.object = game_object
			@shape.u = @friction
			@shape.e = @restitution
			@shape.group = @category
			@shape.layers = @collides_with

			# recalculate inertia
			rigid_body.body.i = CP.moment_for_box(rigid_body.body.m, @width, @height)

			physics.space.add_shape(@shape)
		end

		def before_remove
			physics.space.remove_shape(@shape)
		end
	end
end
