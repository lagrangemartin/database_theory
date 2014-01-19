require "database_theory"
include DatabaseTheory::Dsl

set = DatabaseTheory::FunctionnalDependingSet.new 

set << fd("A,B" => "C")
set << fd("C" => "A")
set << fd("B,C" => "D")
set << fd("A,C,D" => "B")
set << fd("B,E" => "C")
set << fd("C,E" => "F,A")
set << fd("C,F" => "B,D")
set << fd("D" => "E,F")

set.draw("examples/sample02")