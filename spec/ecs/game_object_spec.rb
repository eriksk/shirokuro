require 'spec_helper'

class ConcreteComponent < Shirokuro::Component
end

describe Shirokuro::GameObject do
	it "is created with a name and an id" do
		expect(Shirokuro::GameObject).to respond_to(:new).with(2).arguments
	end

	it "can be updated" do
		expect(Shirokuro::GameObject.new("name", 0)).to respond_to(:update).with(1).argument
	end

	it "can be drawn with a context" do
		expect(Shirokuro::GameObject.new("name", 0)).to respond_to(:draw).with(1).argument
	end

	it "can be started" do
		expect(Shirokuro::GameObject.new("name", 0)).to respond_to(:start).with(0).arguments
	end

	it "can add components" do
		expect(Shirokuro::GameObject.new("name", 0)).to respond_to(:add_component).with(1).argument
	end

	it "can get a component by type" do
		game_object = Shirokuro::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(game_object.get_component(ConcreteComponent)).to be(component)
	end

	it "can get a multiple components by type" do
		game_object = Shirokuro::GameObject.new  "name", 0
		component = ConcreteComponent.new
		component2 = ConcreteComponent.new
		game_object.add_component component
		game_object.add_component component2
		expect(game_object.get_components(ConcreteComponent)).to eq([component, component2])
	end

	it "starts all components when calling start" do
		game_object = Shirokuro::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(component).to receive(:start)
		game_object.start
	end

	it "updates all components when calling update" do
		game_object = Shirokuro::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(component).to receive(:update).with(16.0)
		game_object.update 16.0
	end

	it "draws all components when calling draw" do
		game_object = Shirokuro::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		context = "some_context"
		expect(component).to receive(:draw).with(context)
		game_object.draw context
	end
end