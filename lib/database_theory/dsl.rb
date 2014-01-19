module DatabaseTheory
 	module Dsl

 		# Build a +FunctionnalDependency+ object
	  	# +determinant+:: +String+ object representing the determinant set (comma separated)
	  	# +dependent+:: +String+ object representing the dependent set (comma separated)
	 	def fd(determinant, dependent = '')
	 		FunctionnalDependency.new(determinant,dependent)
  		end
	end
end