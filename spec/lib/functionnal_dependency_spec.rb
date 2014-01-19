require "spec_helper"

module DatabaseTheory

	describe FunctionnalDependency do 
		
		it "should have a determinant set" do
			fd = FunctionnalDependency.new("A,B,C" , "E,F,J")
			fd.determinant.should == ["A","B","C"]
		end

		it "is not possible its determinant is not set" do
			expect { FunctionnalDependency.new() }.to raise_error
		end

		it "should have a dependent set" do
			fd = FunctionnalDependency.new("A,B,C" , "E,F,J")
			fd.dependent.should == ["E","F","J"]
		end

		it "is possible its dependent is not set" do
			fd = FunctionnalDependency.new("A,B,C")
			fd.dependent.should == []
		end
			
	end
end