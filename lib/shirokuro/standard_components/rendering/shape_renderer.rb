module SK
	class ShapeRenderer < Component
		def initialize
		end
		
		def draw context
			rigid_body = get_component(RigidBody)
			color = rigid_body.static ? Gosu::Color::RED : Gosu::Color::GREEN
			
			collider = get_component(BoxCollider)
			
			unless collider == nil
				half_width = collider.width / 2.0
				half_height = collider.height / 2.0

				context.translate(transform.position.x, transform.position.y) do
					context.rotate(transform.rotation.radians_to_degrees) do
						# top
						context.draw_line(
							-half_width, -half_height, color,
							half_width, -half_height, color,
						)
						# bottom
						context.draw_line(
							-half_width, half_height, color,
							half_width, half_height, color,
						)
						# left
						context.draw_line(
							-half_width, -half_height, color,
							-half_width, half_height, color,
						)
						# right
						context.draw_line(
							half_width, -half_height, color,
							half_width, half_height, color,
						)
					end
				end
			end 
		end		
	end
end