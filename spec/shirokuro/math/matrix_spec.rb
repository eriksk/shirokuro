require 'spec_helper'

describe SK::Matrix do
	
	it "can be translated" do
		expect(SK::Matrix).to respond_to(:create_translation).with(2).arguments
	end

	it "can be rotated" do
		expect(SK::Matrix).to respond_to(:create_rotation).with(1).argument
	end

	it "can be scaled" do
		expect(SK::Matrix).to respond_to(:create_scale).with(2).arguments
	end

	it "can create an identity matrix" do
		expect(SK::Matrix).to respond_to(:identity)
	end

	it "can be decomposed" do
		expect(SK::Matrix.new).to respond_to(:decompose)
	end

	it "translates from one position to another properly" #do
#		target = SK::Vec2.new(100, 100)
#		matrix = SK::Matrix.create_translation(target.x, target.y)
#		decomposition = matrix.decompose
#		expect(decomposition.position.x).to eq(100)
#	end

	it "can multiply a transform"# do
#		source = SK::Vec2.new(50, 100)
#		target = SK::Vec2.new(100, 100)
#		matrix = SK::Matrix.create_translation(source.x, source.y) *
#				 SK::Matrix.create_translation(target.x, target.y)
#		decomposition = matrix.decompose
#		expect(decomposition.position.x).to eq(150)
#		expect(decomposition.position.y).to eq(200)
#	end

	it "can rotate a transform" #do
#		matrix = SK::Matrix.create_rotation(90)
#		decomposition = matrix.decompose
#		expect(decomposition.rotation).to eq(90)
		
#	end
end

