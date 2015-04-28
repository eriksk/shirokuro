module SK
	class GameObjectManager

		attr_accessor :physics

		def initialize
			@id_generator = IdGenerator.new
			@game_objects = []
			@game_objects_scheduled_for_removal = []
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
			## TODO: remove children!!
			@game_objects_scheduled_for_removal << game_object
		end

		def start
			@game_objects.each{ |x| x.start }
			@started = true
		end

		def update dt
			@physics.update dt
			@game_objects.each{ |x| x.update dt}
			@game_objects_scheduled_for_removal.each{|o|
				o.before_remove
				@game_objects.delete o
			}
			@game_objects_scheduled_for_removal.clear
		end

		def draw context
			components = []

			# only draw renderable objects
			@game_objects.each do |obj|
				obj.components.each do |c|
					if c.layer
						components << c
					end
				end
			end

			components = components.sort_by{ |a|
					[a.layer, a.order_in_layer]
			}

			components.each do |component|
				component.draw context
			end
		end
	end
end
