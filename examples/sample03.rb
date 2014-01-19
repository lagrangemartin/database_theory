require "database_theory"
include DatabaseTheory::Dsl

set = DatabaseTheory::FunctionnalDependingSet.new 

set << fd("CourseId, ChevalId" => "Numero, JockeyId, Place, Poids, EntraineurId")
set << fd("CourseId, ChevalId" => "CourseId, ChevalId, Numero, JockeyId, Place, Poids, EntraineurId" )
set << fd("CourseId, JockeyId" => "ChevalId")
set << fd("CourseId, JockeyId" => "CourseId, ChevalId" )
set << fd("CourseId, Numero" => "ChevalId" )
set << fd("CourseId, Numero" => "CourseId, ChevalId")
set << fd("CourseId, JockeyId" => "CourseId, ChevalId, Numero, JockeyId, Place, Poids, EntraineurId" )
set << fd("CourseId, Numero" => "CourseId, ChevalId, Numero, JockeyId, Place, Poids, EntraineurId" )
set << fd("CourseId, ChevalId" => "CourseId, JockeyId" )
set << fd("CourseId, JockeyId" => "Place, Poids, EntraineurId" )
set << fd("CourseId, ChevalId" => "Place, Poids, EntraineurId" )

set.draw("examples/sample03")