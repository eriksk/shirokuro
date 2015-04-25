require 'spec_helper'

describe SK::GameObjectManager do

	it "can create a game_object with a name" do
		expect(SK::GameObjectManager.new).to respond_to(:create).with(1).argument
	end

	it "can not create a game_object without a name" do
		expect(SK::GameObjectManager.new).to_not respond_to(:create).with(0).arguments
	end

	it "creates a new game_object when calling name" do
		expect(SK::GameObjectManager.new.create("my_obj").name).to eq("my_obj")
	end

	it "can remove a game_object" do
		manager = SK::GameObjectManager.new
		game_object = manager.create("obj")
		manager.remove(game_object)
		expect(manager.instance_variable_get(:@game_objects).size).to be(0)
	end

	it "starts a gameobject when created if manager alread has started" do
		manager = SK::GameObjectManager.new
		manager.start
		expect_any_instance_of(SK::GameObject).to receive(:start)
		obj = manager.create "obj"
	end

	it "generates a unique id for all new game_objects created" do
		manager = SK::GameObjectManager.new
		expect(manager.create("obj_1").id).to eq(1)
		expect(manager.create("obj_2").id).to eq(2)
		expect(manager.create("obj_3").id).to eq(3)
		expect(manager.create("obj_4").id).to eq(4)
	end

	it "contains the game_object after calling create" do
		manager = SK::GameObjectManager.new
		manager.create("my_obj")
		expect(manager.instance_variable_get(:@game_objects).size).to eq(1)
	end

	it "can be updated" do
		expect(SK::GameObjectManager.new).to respond_to(:update).with(1).argument
	end

	it "can be drawn with a context" do
		expect(SK::GameObjectManager.new).to respond_to(:draw).with(1).argument
	end

	it "starts all gameobjects when calling start" do
		manager = SK::GameObjectManager.new
		obj = manager.create("my_obj")
		expect(obj).to receive(:start)
		manager.start
	end

	it "updates all gameobjects when calling update" do
		manager = SK::GameObjectManager.new
		obj = manager.create("my_obj")
		expect(obj).to receive(:update).with(16.0)
		manager.update 16.0
	end

	it "draws all gameobjects when calling draw" do
		manager = SK::GameObjectManager.new
		obj = manager.create("my_obj")
		context = "some_context"
		expect(obj).to receive(:draw).with(context)
		manager.draw context
	end
end