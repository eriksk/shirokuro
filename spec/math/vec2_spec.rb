require 'spec_helper'

describe Shirokuro::Vec2 do

	it "is a two component vector" do
		expect(Shirokuro::Vec2.new).to respond_to(:x)
		expect(Shirokuro::Vec2.new).to respond_to(:y)
	end

	it "can be initialized with x, y parameters" do
		expect(Shirokuro::Vec2).to respond_to(:new).with(2).arguments
	end

	it "can be added" do
		added = Shirokuro::Vec2.new(100, 100) + Shirokuro::Vec2.new(50, -50)
		expect(added.x).to eq(150)
		expect(added.y).to eq(50)
	end

	it "can be subtracted" do
		subtracted = Shirokuro::Vec2.new(100, 100) - Shirokuro::Vec2.new(50, 25)
		expect(subtracted.x).to eq(50)
		expect(subtracted.y).to eq(75)
	end

	it "can be multiplied" do
		multiplied = Shirokuro::Vec2.new(100, 100) * Shirokuro::Vec2.new(2, 3)
		expect(multiplied.x).to eq(200)
		expect(multiplied.y).to eq(300)
	end

	it "can be divided" do
		divided = Shirokuro::Vec2.new(100, 100) / Shirokuro::Vec2.new(2, 4)
		expect(divided.x).to eq(50)
		expect(divided.y).to eq(25)
	end

	it "can be multiplied using a scalar" do
		multiplied = Shirokuro::Vec2.new(100, 150) * 2.0
		expect(multiplied.x).to eq(200)
		expect(multiplied.y).to eq(300)
	end

	it "can be devided using a scalar"
end