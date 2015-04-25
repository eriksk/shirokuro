require 'spec_helper'
require 'gosu'

describe SK::Transform do

	it "has a position" do
		expect(SK::Transform.new.position).to be_a(SK::Vec2)
	end

	it "has a rotation" do
		expect(SK::Transform.new.rotation).to be_a(Float)
	end

	it "has a scale" do
		expect(SK::Transform.new.scale).to be_a(SK::Vec2)
	end

	it "is initialized with a scale of 1.0" do
		scale = SK::Transform.new.scale
		expect(scale.x).to eq(1.0)
		expect(scale.y).to eq(1.0)
	end

	it "can be multiplied as a matrix" #do
#		transform = Shirokuro::Transform.new#
#		expect(transform.matrix).to be_a(Matrix)
#	end
end