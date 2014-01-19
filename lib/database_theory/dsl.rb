module DatabaseTheory
 	module Dsl

  		def fd(hash = {})
	 		determinant = hash.first[0]
	 		dependent = hash.first[1] 
	 		FunctionnalDependency.new(determinant,dependent)
  		end

  		# Build a +FunctionnalDependency+ object
	  	# +determinant+:: +String+ object representing the determinant set (comma separated)
	  	# +dependent+:: +String+ object representing the dependent set (comma separated)
	 	#def fd(determinant, dependent = '')
	 	#	FunctionnalDependency.new(determinant,dependent)
  		#end


	end
end