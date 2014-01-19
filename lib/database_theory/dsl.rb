module DatabaseTheory
 	module Dsl
	 	def fd(determinant, dependent = '')
	 		FunctionnalDependency.new(determinant,dependent)
  		end
	end
end