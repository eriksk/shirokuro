require 'spec_helper'

class ConcreteComponent < SK::Component
end
class ConcreteComponent2 < SK::Component
end

describe SK::Component do
	
	it "can be instantiated without arguments" do
		expect(SK::Component.new).to_not be_nil
	end

	it "is initialized with a nil game_object" do
		expect(SK::Component.new.game_object).to be_nil
	end

	it "can be updated" do
		expect(SK::Component.new).to respond_to(:update)
	end

	it "can be updated and takes one parameter" do
		expect(SK::Component.new).to respond_to(:update).with(1).argument
	end

	it "can be drawn using a context" do
		expect(SK::Component.new).to respond_to(:draw).with(1).argument
	end

	it "can not be drawn without context" do
		expect(SK::Component.new).to_not respond_to(:draw).with(0).arguments
	end

	it "can remove itself from the game_object" do
		component = SK::Component.new
		game_object = SK::GameObject.new "name", 0
		game_object.add_component component
		component.remove(component)
		expect(game_object.instance_variable_get(:@components).size).to be(0)
	end

	it "is assigned the game_object when added to one" do
		component = SK::Component.new
		game_object = SK::GameObject.new "name", 0
		game_object.add_component component
		expect(component.game_object).to be(game_object)
	end

	it "can get other components by type" do
		game_object = SK::GameObject.new "name", 0
		component = ConcreteComponent.new
		component_2 = ConcreteComponent2.new
		game_object.add_component component
		game_object.add_component component_2
		
		expect(component.get_component(ConcreteComponent2)).to be(component_2)
	end

	it "returns nil if getting component that does not exist" do
		game_object = SK::GameObject.new "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		
		expect(component.get_component(ConcreteComponent2)).to be(nil)
	end
end