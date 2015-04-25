module SK
	class MapRenderer < Component

		attr_accessor :images

		def initialize images
			@images = images
		end

		def start
			@map = get_component(MapComponent)
			if @map == nil
				raise "MapComponent required for MapRenderer"
			end
		end
		
		def draw context
			map = @map.map

			map.layers.each do |layer|
				if layer.type == "tilelayer" && layer.visible
					layer.width.times do |col|
						layer.height.times do |row|
							cell = layer.get(col, row)
							if cell > -1
								@images[cell].draw(
									transform.position.x + (map.tile_width * col), 
									transform.position.y + (map.tile_height * row), 0, 1, 1, layer.color)
							end
						end
					end
				end
			end
		end
	end
end