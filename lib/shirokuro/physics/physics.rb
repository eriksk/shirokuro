module SK
	class Physics

		attr_reader :space
		attr_accessor :simulation_substeps

		def initialize
			@space = CP::Space.new
			@space.gravity.y = 100.0
			@simulation_substeps = 6
			@space.set_default_collision_handler DefaultCollisionHandler.new
		end

		def update dt
			@simulation_substeps.times do
				@space.step((1.0 / 30.0) / @simulation_substeps.to_f)
			end

			@space.instance_variable_get(:@bodies).each do |body|
				body.reset_forces
			end
		end
	end

	class DefaultCollisionHandler
		def begin a, b, arbiter
			unless share_group?(a, b)
				return false
			end
			if a.object.is_a?(GameObject)
				a.object.on_collision(a, b)
			end
			if b.object.is_a?(GameObject)
				b.object.on_collision(a, b)
			end
			return true
		end

		def share_group? a, b
			# masked collision groups
			((a.group & b.layers) != 0) && ((b.group & a.layers) != 0)
		end
	end
end
