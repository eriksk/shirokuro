require 'spec_helper'

describe SK::Vec2 do

	it "is a two component vector" do
		expect(SK::Vec2.new).to respond_to(:x)
		expect(SK::Vec2.new).to respond_to(:y)
	end

	it "can be initialized with x, y parameters" do
		expect(SK::Vec2).to respond_to(:new).with(2).arguments
	end

	it "can be added" do
		added = SK::Vec2.new(100, 100) + SK::Vec2.new(50, -50)
		expect(added.x).to eq(150)
		expect(added.y).to eq(50)
	end

	it "can be subtracted" do
		subtracted = SK::Vec2.new(100, 100) - SK::Vec2.new(50, 25)
		expect(subtracted.x).to eq(50)
		expect(subtracted.y).to eq(75)
	end

	it "can be multiplied" do
		multiplied = SK::Vec2.new(100, 100) * SK::Vec2.new(2, 3)
		expect(multiplied.x).to eq(200)
		expect(multiplied.y).to eq(300)
	end

	it "can be divided" do
		divided = SK::Vec2.new(100, 100) / SK::Vec2.new(2, 4)
		expect(divided.x).to eq(50)
		expect(divided.y).to eq(25)
	end

	it "can be multiplied using a scalar" do
		multiplied = SK::Vec2.new(100, 150) * 2.0
		expect(multiplied.x).to eq(200)
		expect(multiplied.y).to eq(300)
	end

	it "can be devided using a scalar" do
		divided = SK::Vec2.new(400, 600) / 2.0
		expect(divided.x).to eq(200)
		expect(divided.y).to eq(300)
	end
end