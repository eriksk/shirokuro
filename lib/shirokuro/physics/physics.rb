module SK
	class Physics

		attr_reader :space

		def initialize
			@space = CP::Space.new
			@space.gravity.y = 100.0
			@simulation_substeps = 6
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
end