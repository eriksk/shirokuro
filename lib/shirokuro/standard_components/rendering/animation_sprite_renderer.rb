module SK
	class AnimationSpriteRenderer < Component

		attr_accessor :origin, :images

		def initialize images
			super()
			@images = images
			@origin = Vec2.new(0.5, 0.5)
		end

		def start
			@animations = get_component(AnimationComponent)
		end

		def draw context
			@images[@animations.frame].draw_rot(
				transform.position.x, transform.position.y, 0,
				transform.rotation.radians_to_degrees,
				@origin.x, @origin.y,
				transform.scale.x, transform.scale.y,
				Gosu::Color::WHITE
			)
		end

	end
end
