require "spec_helper"

include DatabaseTheory::Dsl

	describe DatabaseTheory::Dsl do 
		it "should return a FunctionnalDependency" do
			expected = DatabaseTheory::FunctionnalDependency.new "A,B,C", "J,F,K"
			current = fd "A,B,C" => "J,F,K"

			[current.determinant, current.dependent].should == [expected.determinant, expected.dependent]
		end
	end

