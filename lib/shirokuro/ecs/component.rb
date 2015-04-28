module SK
	class Component

		attr_accessor :game_object, :layer, :order_in_layer

		def initialize
			@game_object = nil
			@layer = 0
			@order_in_layer = 0
		end

		def get_component type
			@game_object.get_component type
		end

		def remove component
			@game_object.remove_component component
		end

		def transform
			@game_object.transform
		end

		def physics
			@game_object.physics
		end

		def before_remove
		end

		def on_collision a, b
		end

		def start
		end

		def update dt
		end

		def draw context
		end
	end
end
