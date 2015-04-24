module Shirokuro
	class GameObject

		attr_reader :name, :id

		def initialize name, id
			@name = name
			@id = id
			@components = []
		end

		def add_component component
			component.game_object = self
			@components << component
		end

		def get_component type
			@components.find{|x| x.is_a?(type)}
		end

		def get_components type
			@components.collect{|x| x if x.is_a?(type)}
		end

		def start
			@components.each{|x| x.start }
		end

		def update dt
			@components.each{|x| x.update dt }
		end

		def draw context
			@components.each{|x| x.draw context }
		end
	end
end