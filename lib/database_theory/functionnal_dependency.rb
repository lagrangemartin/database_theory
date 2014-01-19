module DatabaseTheory
	class FunctionnalDependency

		attr_accessor :determinant, :dependent 

		# Build a +FunctionnalDependency+ object
	  	# +determinant+:: +String+ object representing the determinant set (comma separated)
	  	# +dependent+:: +String+ object representing the dependent set (comma separated)
		def initialize(determinant, dependent = '')
			@determinant, @dependent = determinant.split(","), dependent.split(",")
		end

		def determinant_singleton?
			@determinant.size == 1
		end

		# Return each uniq attributes of the functonnal dependency
		def unique_attributes
			(@determinant | @dependent)
		end

	end
end