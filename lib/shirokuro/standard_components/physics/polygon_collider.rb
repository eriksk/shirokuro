module SK
	class PolygonCollider < Component

		attr_accessor :vertices, :friction, :restitution, :shape, :category, :collides_with

		def initialize vertices, offset = nil
			super()
			@offset = offset
			@vertices = vertices
			@friction = 0.4
			@restitution = 0.1
			@category = 0
			@collides_with = 0
		end

		def start
			rigid_body = get_component(RigidBody)

			if rigid_body == nil
				raise "RigidBody required for BoxCollider"
			end

			unless CP::Shape::Poly.valid?(@vertices)
				raise "Vertices does not form a valid polygon"
			end

			centroid = CP::centroid_for_poly(@vertices)
			if @offset
				centroid = @offset
			end

			@shape = CP::Shape::Poly.new(rigid_body.body, vertices, centroid)
			@shape.object = game_object
			@shape.u = @friction
			@shape.e = @restitution
			@shape.group = @category
			@shape.layers = @collides_with

			# recalculate inertia
			rigid_body.body.i = CP.moment_for_poly(rigid_body.body.m, @vertices, centroid)

			physics.space.add_shape(@shape)
		end

		def before_remove
			physics.space.remove_shape(@shape)
		end
	end
end
