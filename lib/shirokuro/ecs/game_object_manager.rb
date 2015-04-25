module SK
	class GameObjectManager

		attr_accessor :physics

		def initialize
			@id_generator = IdGenerator.new
			@game_objects = []			
			@started = false

			@physics = Physics.new
		end

		def create name
			id = @id_generator.next()
			game_object = GameObject.new(name, id)
			game_object.instance_variable_set(:@manager, self)
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
			@physics.update dt
			@game_objects.each{ |x| x.update dt}
		end

		def draw context
			@game_objects.each{ |x| x.draw context }
		end
	end
end