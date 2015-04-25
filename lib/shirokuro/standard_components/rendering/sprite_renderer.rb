module SK
	class SpriteRenderer < Component

		attr_accessor :origin, :image

		def initialize image
			@image = image
			@origin = Vec2.new(0.5, 0.5)
		end

		def draw context
			@image.draw_rot(
				transform.position.x, transform.position.y, 0,
				transform.rotation.radians_to_degrees,
				@origin.x, @origin.y,
				transform.scale.x, transform.scale.y,
				Gosu::Color::WHITE
			)
		end
	end
end