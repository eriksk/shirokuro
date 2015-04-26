module SK
	module TMX
		class MapLayer

			attr_accessor :properties, :width, :height, :data, :visible, :objects, :type, :color

			def initialize json
				@name = json["name"]
				@opacity = json["opacity"].to_f
				@visible = json["visible"]
				@data = json["data"]
				@width = json["width"].to_i
				@height = json["height"].to_i
				@properties = json["properties"]
				@type = json["type"]
				@objects = []

				if json["objects"]
					json["objects"].each do |obj|
						@objects << MapLayerObject.new(obj)
					end
				end
				@color = Gosu::Color.new(255, 255 * @opacity, 255 * @opacity, 255 * @opacity)
			end

			def is_collision_layer?
				if @properties != nil && @properties["collision"] == "true"
					return true
				end
				false
			end

			def get(col, row)
				@data[col + row * @width] - 1
			end
		end
	end
end
