require "database_theory"
include DatabaseTheory::Dsl

set = DatabaseTheory::FunctionnalDependingSet.new 

set << fd("A" => "B,C,D")
set << fd("D" => "A")
set << fd("B" => "I")
set << fd("I" => "K,L")
set << fd("C" => "J")
set << fd("J" => "O")
set << fd("O" => "B")
set << fd("A" => "B")

set.draw("sample01")