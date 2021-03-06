require 'graphviz'
require 'set'

module DatabaseTheory
	class FunctionnalDependingSet

		attr_accessor :functionnal_dependencies

		# Build a +FunctionnalDependingSet+ object

		def initialize(functionnal_dependencies =[])
			@functionnal_dependencies = functionnal_dependencies
		end

		def <<(functionnal_dependency)
			@functionnal_dependencies << functionnal_dependency
		end

		# Draw the functionnal depending set
		def draw(picture_path)


			g = GraphViz.new(:G)
			g.node[:shape] = "circle"
			#g.node[:color] = "black"
			g.node[:color] = "white"
			g.node[:width] = "0.01"
			g.node[:height] = "0.01"
			
			#g.edge[:color] = "black"

			#g.edge[:style] = "filled"
			#g.edge[:label] = ""


			existing_edges = Set.new

			@functionnal_dependencies.each do |fd|

				# We create each node for each attributes of the functionnal dependency if they not exists
				# Each attribute is uniq in the functionnal dependency graph

				fd.unique_attributes.each do |attribute|
					g.add_nodes(attribute, :label => attribute) if not g.get_node(attribute)
				end

				# The FD determinant is singleton
				if fd.determinant_singleton?

					# We connect the singleton determinant to its dependents
					singleton_determinant_node = g.get_node(fd.determinant.first)


					fd.dependent.each do |dependent|
						# Does this edge already exists ?
						dependent_node = g.get_node(dependent)
				 		edge_id ="#{singleton_determinant_node.__id__}=>#{dependent_node.__id__}"

						g.add_edges(singleton_determinant_node, dependent_node ) if not existing_edges.include? edge_id
						existing_edges << edge_id
					end
				else
					#We create a union node which is the unification of each determinant 
					# A|B|C

					union_node_name = fd.determinant.join('|')
					union_node = g.get_node(union_node_name)
					union_node ||= g.add_nodes(union_node_name, :label => "O", width: 0.01, height: 0.01 ,color: "black", style: "filled",fontsize: 5)
				 	
				 	# We connect each dependent to the union node
				 	fd.determinant.each do |determinant|
				 		determinant_node = g.get_node(determinant)
				 		edge_id ="#{determinant_node.__id__}=>#{union_node.__id__}"
						g.add_edges(determinant_node,union_node) if not existing_edges.include? edge_id
						existing_edges << edge_id
						
					end


					# We connect the union node to each dependent
				 	fd.dependent.each do |dependent|
				 		dependent_node = g.get_node(dependent)
						edge_id ="#{union_node.__id__}=>#{dependent_node.__id__}"
						g.add_edges(union_node, dependent_node) if not existing_edges.include? edge_id
						existing_edges << edge_id
					end

				end




			g.output(:png => "#{picture_path}.png")

			end

			
		end

		# Compute and return the closure of the set of functionnal dependencies
		def closure

		end

	end
end