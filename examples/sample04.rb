require "database_theory"
include DatabaseTheory::Dsl

set = DatabaseTheory::FunctionnalDependingSet.new 


set << fd('N°Plat'=>'nomPlat,tpsPrepaPlatTheorique,tpsCuissonTheorique,N°Categorie')
set << fd('N°Categorie'=>'libelleCategoriePlat')
set << fd('N°Ingredient'=>'nomIngredient')
set << fd('N°Plat,N°Ingredient'=>'QuantitéIngredientPlat')
set << fd('N°Vin'=>'nomVin')
set << fd('N°Vin,N°Plat'=>'')
set << fd('N°Ordre,N°Menu'=>'N°Plat')
set << fd('N°Menu'=>'prixMenu')
set << fd('N°Menu,N°Commande'=>'nombreDeMenu')
set << fd('N°Commande'=>'dateCommande,dateLivraison,N°Client')
set << fd('N°Client'=>'telClient,nomClient,adresseClient,CPClient,faxClient')
set << fd('N°Cuisinier'=>'nomCusiinier,dateEmbauche')
set << fd('N°Atelier'=>'N°Cusisinier')
set << fd('N°Cuisinier'=>'N°Atelier')
set << fd('N°Atelier'=>'telAtelier')
set << fd('N°Atelier,N°Plat,jour'=>'nbPlatPrepa,tpsPrepaReel,tpsCuissonReel')




set.draw("examples/sample04")