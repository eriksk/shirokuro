module SK
	class CircleCollider < Component

		attr_accessor :radius, :friction, :restitution, :shape

		def initialize radius
			super()
			@radius = radius
			@friction = 0.4
			@restitution = 0.1
		end

		def start
			rigid_body = get_component(RigidBody)

			if rigid_body == nil
				raise "RigidBody required for BoxCollider"
			end

			@shape = CP::Shape::Circle.new(rigid_body.body, @radius, CP::Vec2.new(0, 0))
			@shape.u = @friction
			@shape.e = @restitution

			# recalculate inertia
			rigid_body.body.i = CP.moment_for_circle(rigid_body.body.m, @radius, @radius, CP::Vec2.new(0, 0))

			physics.space.add_shape(@shape)
		end
	end
end
