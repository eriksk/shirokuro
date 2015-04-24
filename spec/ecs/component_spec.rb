require 'spec_helper'

class ConcreteComponent < Shirokuro::Component
end
class ConcreteComponent2 < Shirokuro::Component
end

describe Shirokuro::Component do
	
	it "can be instantiated without arguments" do
		expect(Shirokuro::Component.new).to_not be_nil
	end

	it "is initialized with a nil game_object" do
		expect(Shirokuro::Component.new.game_object).to be_nil
	end

	it "can be updated" do
		expect(Shirokuro::Component.new).to respond_to(:update)
	end

	it "can be updated and takes one parameter" do
		expect(Shirokuro::Component.new).to respond_to(:update).with(1).argument
	end

	it "can be drawn using a context" do
		expect(Shirokuro::Component.new).to respond_to(:draw).with(1).argument
	end

	it "can not be drawn without context" do
		expect(Shirokuro::Component.new).to_not respond_to(:draw).with(0).arguments
	end

	it "is assigned the game_object when added to one" do
		component = Shirokuro::Component.new
		game_object = Shirokuro::GameObject.new "name", 0
		game_object.add_component component
		expect(component.game_object).to be(game_object)
	end

	it "can get other components by type" do
		game_object = Shirokuro::GameObject.new "name", 0
		component = ConcreteComponent.new
		component_2 = ConcreteComponent2.new
		game_object.add_component component
		game_object.add_component component_2
		
		expect(component.get_component(ConcreteComponent2)).to be(component_2)
	end

	it "returns nil if getting component that does not exist" do
		game_object = Shirokuro::GameObject.new "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		
		expect(component.get_component(ConcreteComponent2)).to be(nil)
	end
end