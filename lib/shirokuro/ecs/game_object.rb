module SK
	class GameObject

		attr_reader :name, :id, :children, :manager, :components
		attr_accessor :parent, :transform

		def initialize name, id
			@name = name
			@id = id
			@components = []
			@children = []
			@parent = nil
			@transform = Transform.new
			@manager = nil
		end

		def add_component component
			component.game_object = self
			@components << component
		end

		def add_child game_object
			if game_object.parent != nil
				game_object.parent.remove_child game_object
			end
			game_object.parent = self
			@children << game_object
		end

		def remove_child game_object
			@children.delete game_object
		end

		def get_component type
			@components.find{|x| x.is_a?(type)}
		end

		def get_components type
			@components.collect{|x| x if x.is_a?(type)}
		end

		def remove_component component
			@components.delete component
		end

		def physics
			@manager.physics
		end

		def start
			@components.each{|x| x.start }
		end

		def update dt
			@components.each{|x| x.update dt }
		end
	end
end