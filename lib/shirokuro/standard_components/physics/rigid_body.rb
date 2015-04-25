module SK
	class RigidBody < Component
		
		attr_accessor :mass, :inertia, :static, :fixed_rotation
		attr_reader :body

		def initialize
			@mass = 1.0
			@inertia = 1.0
			@static = false
			@fixed_rotation = false
		end
		
		def start
			if @static
				@body = CP::Body.new_static()
			else
				@body = CP::Body.new(@mass, @inertia)
				physics.space.add_body(@body)
			end
			teleport(transform.position.x, transform.position.y)
		end

		def teleport x, y
			@body.p.x = x
			@body.p.y = y
			transform.position.x = x
			transform.position.y = y
		end

		def set_rotation rotation
			transform.rotation = rotation
			@body.t = rotation
		end

		def add_force force
			@body.apply_force(force, CP::Vec2.new(0, 0))
		end

		def add_impulse impulse
			@body.apply_impulse(impulse, CP::Vec2.new(0, 0))
		end

		def add_torque torque
			@body.t += torque
		end
		
		def update dt
			if @fixed_rotation
				@body.a = 0.0
			end
			transform.position.x = @body.p.x
			transform.position.y = @body.p.y
			transform.rotation = @body.a
		end
	end
end