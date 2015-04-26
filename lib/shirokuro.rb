require 'chipmunk'

require "shirokuro/math/matrix"
require "shirokuro/math/vec2"
require "shirokuro/math/transform"

require "shirokuro/physics/physics"

require "shirokuro/version"
require "shirokuro/ecs/component"
require "shirokuro/ecs/game_object"
require "shirokuro/ecs/game_object_manager"
require "shirokuro/ecs/id_generator"

require "shirokuro/content/content_manager"
require "shirokuro/audio/audio_manager"

require "shirokuro/standard_components/cameras/camera"

require "shirokuro/standard_components/rendering/sprite_renderer"
require "shirokuro/standard_components/rendering/animation_sprite_renderer"
require "shirokuro/standard_components/rendering/map_renderer"
require "shirokuro/standard_components/rendering/shape_renderer"

require "shirokuro/standard_components/maps/map_component"

require "shirokuro/standard_components/transformation/rotation"

require "shirokuro/standard_components/animations/animation"
require "shirokuro/standard_components/animations/animation_component"

require "shirokuro/standard_components/tmx/tmx_map"
require "shirokuro/standard_components/tmx/tmx_map_layer"
require "shirokuro/standard_components/tmx/tmx_map_layer_object"

require "shirokuro/standard_components/physics/rigid_body"
require "shirokuro/standard_components/physics/box_collider"
require "shirokuro/standard_components/physics/circle_collider"
require "shirokuro/standard_components/physics/polygon_collider"

module SK
end
