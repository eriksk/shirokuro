module SK
	module TMX
		class MapLayerObject

			attr_accessor :x, :y, :width, :height, :rotation, :type

			def initialize json
				@x = json["x"].to_f
				@y = json["y"].to_f	
				@width = json["width"].to_f
				@height = json["height"].to_f	
				@rotation = json["rotation"].to_f
				@type = json["type"]
			end
		end
	end
end