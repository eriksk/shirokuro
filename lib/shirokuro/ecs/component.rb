module SK
	class Component

		attr_accessor :game_object

		def initialize
			@game_object = nil
		end

		def get_component type
			@game_object.get_component type
		end

		def remove component
			@game_object.remove_component component
		end

		def update dt
		end

		def draw context
		end
	end
end