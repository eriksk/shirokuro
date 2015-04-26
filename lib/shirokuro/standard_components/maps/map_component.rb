module SK
	class MapComponent < Component

		attr_accessor :map

		def initialize map
			super()
			@map = map
		end
	end
end
