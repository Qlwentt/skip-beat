require_relative 'spec_helper'
require_relative '../lib/door.rb'

describe SkipBeat::Door do
	let(:default_door){SkipBeat::Door.new("you shall not pass")}
	let(:closed_unlocked_door){SkipBeat::Door.new(false,false,"closed unlocked")}
	let(:open_unlocked_door){SkipBeat::Door.new(true,false,"unlocked open")}
	let(:no_inscrp){SkipBeat::Door.new("")}

	it "can display an inscrption" do
		expect(default_door.inscription).must_equal("you shall not pass")
	end

	it "will not allow inscrption to be changed" do
		expect(proc{default_door.inscrption="hello"}).must_raise(NoMethodError)
	end

	it "(default door) starts off being closed" do
		expect(default_door.is_open).must_equal(false)
	end

	it "(default door) starts off locked" do
		expect(default_door.is_locked).must_equal(true)
	end

	it "can be unlocked if it is locked" do
		expect(default_door.is_locked).must_equal(true)
		default_door.unlock
		expect(default_door.is_locked).must_equal(false)
	end
	
	it "cannot be unlocked if it is already unlocked" do
		expect(proc{closed_unlocked_door.unlock}).must_raise(RuntimeError)
	end


	it "can be opened if it is closed and unlocked" do
		expect(default_door.is_open).must_equal(false)
		expect(default_door.is_locked).must_equal(true)
		default_door.unlock 
		default_door.open
		expect(default_door.is_open).must_equal(true)
	end

	# it "can be reset back to default settings (closed and locked)" do
	# 	default_door.reset
	# 	status=default_door.is_open?,default_door.is_locked?
	# 	expect(status).must_equal([false,true])
	# end

	it "cannot be opened if it is closed and locked" do
		status=default_door.is_open,default_door.is_locked
		expect(status).must_equal([false,true])
		expect(proc{default_door.open}).must_raise(RuntimeError)
	end

	it "cannot be opened if it is already open" do
		expect(proc{open_unlocked_door.open}).must_raise(RuntimeError)
	end

	it "can be closed if it is open" do
		open_unlocked_door.close
		expect(open_unlocked_door.is_open).must_equal(false)
	end

	it "cannot be closed if it is already closed" do
		expect(proc{default_door.close}).must_raise(RuntimeError)
	end


	it "can be locked if it is unlocked" do
		closed_unlocked_door.lock
		expect(closed_unlocked_door.is_locked).must_equal(true)
	end

	it "cannot be locked if it is already locked" do
		expect(proc{default_door.lock}).must_raise(RuntimeError)
	end

	it "says there is no inscrption if inscr. is empty string" do
		expect(no_inscrp.inscription).must_equal("There is no inscription on this door")
	end

end