module SK
	class RigidBody < Component

		attr_accessor :mass, :inertia, :static, :fixed_rotation, :ignore_gravity
		attr_reader :body

		def initialize
			super()
			@mass = 1.0
			@inertia = 1.0
			@static = false
			@fixed_rotation = false
			@ignore_gravity = false
		end

		def start
			if @static
				@body = CP::Body.new_static()
			else
				@body = CP::Body.new(@mass, @inertia)
				physics.space.add_body(@body)
			end

			if @ignore_gravity
				# ignore gravity
				@body.velocity_func() { |body, gravity, damping, dt|
					body.update_velocity(CP::Vec2.new(0.0, 0.0), damping, dt)
				}
			end

			teleport(transform.position.x, transform.position.y)
		end

		def before_remove
			unless @static
				physics.space.remove_body(@body)
			end
		end

		def teleport x, y
			@body.p.x = x
			@body.p.y = y
			transform.position.x = x
			transform.position.y = y
		end

		def set_x x
				@body.p.x = x
				transform.position.x = x
		end

		def set_y y
				@body.p.y = y
				transform.position.y = y
		end

		def set_rotation rotation
			transform.rotation = rotation
			@body.a = rotation
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
