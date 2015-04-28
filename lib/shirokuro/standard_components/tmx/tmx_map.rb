module SK
	module TMX
		class Map

			attr_accessor :width, :height, :tile_width, :tile_height, :layers

			def initialize json
				@width = json["width"]
				@height = json["height"]
				@tile_width = json["tilewidth"]
				@tile_height = json["tileheight"]

				@layers = []
				json["layers"].each{ |layer|
					@layers << MapLayer.new(layer)
				}
			end

			def collision_layer
				@layers.find{|x| x.is_collision_layer? }
			end
		end
	end
end
