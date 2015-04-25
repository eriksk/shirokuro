require 'spec_helper'

class ConcreteComponent < SK::Component
end

describe SK::GameObject do

	describe "Parent-Child relationship" do 
		it "can have a parent" do
			expect(SK::GameObject.new("name", 0)).to respond_to(:parent)
		end

		it "can get parent" do
			obj = SK::GameObject.new "obj", 0
			parent = SK::GameObject.new "parent", 1
			obj.instance_variable_set(:@parent, parent)
			expect(obj.parent).to be(parent)
		end

		it "can not set parent" #do
		#	expect(SK::GameObject.new("obj", 0).parent = "").to raise(Exception)
		#end

		it "can be without parent" do 
			expect(SK::GameObject.new("obj", 0).parent).to be_nil
		end

		it "can add children" do
			obj = SK::GameObject.new "obj", 0
			parent = SK::GameObject.new "parent", 1
			parent.add_child obj
			expect(obj.parent).to be(parent)
		end

		it "can list children" do
			parent = SK::GameObject.new "parent", 1
			10.times do
				parent.add_child(SK::GameObject.new("obj", 0))
			end
			expect(parent.children.size).to be(10)
		end

		it "removes a child from parent list when child is added to another parent" do
			parent1 = SK::GameObject.new "parent1", 1
			parent2 = SK::GameObject.new "parent2", 2
			child = SK::GameObject.new("obj", 3)
			parent1.add_child child
			expect(child.parent).to be(parent1)
			parent2.add_child child
			expect(child.parent).to be(parent2)
			expect(parent1.children.size).to eq(0)
		end
	end

	it "is created with a name and an id" do
		expect(SK::GameObject).to respond_to(:new).with(2).arguments
	end

	it "has a transform" do
		expect(SK::GameObject.new("name", 0).transform).to be_a(SK::Transform)
	end

	it "can be updated" do
		expect(SK::GameObject.new("name", 0)).to respond_to(:update).with(1).argument
	end

	it "can be drawn with a context" do
		expect(SK::GameObject.new("name", 0)).to respond_to(:draw).with(1).argument
	end

	it "can be started" do
		expect(SK::GameObject.new("name", 0)).to respond_to(:start).with(0).arguments
	end

	it "can add components" do
		expect(SK::GameObject.new("name", 0)).to respond_to(:add_component).with(1).argument
	end

	it "can remove components" do
		expect(SK::GameObject.new("name", 0)).to respond_to(:remove_component).with(1).argument
	end

	it "can get a component by type" do
		game_object = SK::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(game_object.get_component(ConcreteComponent)).to be(component)
	end

	it "can get a multiple components by type" do
		game_object = SK::GameObject.new  "name", 0
		component = ConcreteComponent.new
		component2 = ConcreteComponent.new
		game_object.add_component component
		game_object.add_component component2
		expect(game_object.get_components(ConcreteComponent)).to eq([component, component2])
	end

	it "starts all components when calling start" do
		game_object = SK::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(component).to receive(:start)
		game_object.start
	end

	it "updates all components when calling update" do
		game_object = SK::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		expect(component).to receive(:update).with(16.0)
		game_object.update 16.0
	end

	it "draws all components when calling draw" do
		game_object = SK::GameObject.new  "name", 0
		component = ConcreteComponent.new
		game_object.add_component component
		context = "some_context"
		expect(component).to receive(:draw).with(context)
		game_object.draw context
	end
end