module SK
	class ShapeRenderer < Component
		def initialize
		end
		
		def draw context
			rigid_body = get_component(RigidBody)
			color = rigid_body.static ? Gosu::Color::BLUE : Gosu::Color::GREEN
			
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

			collider = get_component(CircleCollider)

			unless collider == nil
				radius = collider.radius

				context.translate(transform.position.x, transform.position.y) do
					context.rotate(transform.rotation.radians_to_degrees) do
						# line
						context.draw_line(
							0, 0, color,
							0, radius, color
						)
						x = Math::cos(0) * radius
						y = Math::sin(0) * radius
						(0..360).each do |i|
							if i.even? # only draw half of them
								_x = Math::cos(i.degrees_to_radians) * radius
								_y = Math::sin(i.degrees_to_radians) * radius
								context.draw_line(
									x, y, color,
									_x, _y, color
								)			
								x = _x
								y = _y	
							end			
						end
					end
				end
			end

			collider = get_component(PolygonCollider)

			unless collider == nil
				context.translate(transform.position.x, transform.position.y) do
					context.rotate(transform.rotation.radians_to_degrees) do
						(collider.vertices.size).times do |i|
							p = collider.vertices[i]
							if i == collider.vertices.size - 1
								p_next = collider.vertices[0]
							else
								p_next = collider.vertices[i + 1]
							end
							
							context.draw_line(
								p.x, p.y, color,
								p_next.x, p_next.y, color
							)
						end
					end
				end
			end
		end		
	end
end