module SK
	class ContentManager

		attr_accessor :content_root

		def initialize window, content_root, nearest_filtering = false
			@window = window
			@cache = {}
			@content_root = content_root.end_with?("/") ? content_root : "#{content_root}/" 
			@nearest_filtering = nearest_filtering
		end

		def load_image(name)
			asset_name = "#{@content_root}#{name}"
			unless @cache[asset_name] == nil
				return @cache[asset_name]
			end
			@cache[asset_name] = Gosu::Image.new(@window, asset_name)
			
			if @nearest_filtering
				@cache[asset_name].retro!
			end

			return load_image(name)
		end

		def load_tiles(name, tile_width, tile_height, tileable = true)
			asset_name = "#{@content_root}#{name}"
			unless @cache[asset_name] == nil
				return @cache[asset_name]
			end
			@cache[asset_name] = Gosu::Image.load_tiles(@window, asset_name, tile_width, tile_height, tileable)

			if @nearest_filtering
				@cache[asset_name].each{ |image|
					image.retro!
				}
			end
			
			return load_tiles(name, tile_width, tile_height)
		end
	end
end

# TODO: Move to Gosu extensions dir
require 'opengl'
include GL

module Gosu
	class Image
		def retro!
			glBindTexture(GL_TEXTURE_2D, self.gl_tex_info.tex_name)
		    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST)
		    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)
		    self
		end
	end
end
