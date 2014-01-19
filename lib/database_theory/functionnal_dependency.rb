module DatabaseTheory
	class FunctionnalDependency

		attr_accessor :determinant, :dependent 

		def initialize(determinant, dependent = '')

			@determinant, @dependent = determinant.split(","), dependent.split(",")

		end

	end
end