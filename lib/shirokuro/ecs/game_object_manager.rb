module Shirokuro
	class GameObjectManager

		def initialize
			@id_generator = IdGenerator.new
			@game_objects = []			
			@started = false
		end

		def create name
			id = @id_generator.next()
			game_object = GameObject.new(name, id)
			@game_objects << game_object
			if @started
				game_object.start
			end
			game_object
		end

		def remove game_object
			@game_objects.delete game_object
		end

		def start
			@game_objects.each{ |x| x.start }
			@started = true
		end

		def update dt
			@game_objects.each{ |x| x.update dt}
		end

		def draw context
			@game_objects.each{ |x| x.draw context }
		end
	end
end