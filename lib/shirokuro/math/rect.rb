module SK
	class Rect
		attr_accessor :x, :y, :width, :height

		def initialize x = 0.0, y = 0.0, width = 0.0, height = 0.0
			@x = x
			@y = y
      @width = width
      @height = height
		end

    def left
      @x
    end

    def right
      @x + @width
    end

    def top
      @y
    end

    def bottom
      @y + @height
    end
	end
end
