import 'Ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String image;
  final String typeRecette;
  final int nbPersonne;
  final int difficulty;
  final String tempsTotal;
  final String tempsPrep;
  final String tempsCuisson;

  final List<String> etapes;
  final List<Ingredient> ingredients;

  Recipe(
      {this.id,
      this.name,
      this.image,
      this.typeRecette,
      this.nbPersonne,
      this.difficulty,
      this.tempsTotal,
      this.tempsPrep,
      this.tempsCuisson,
      this.etapes,
      this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      typeRecette: json['type_recette'],
      nbPersonne: json['nb_personne'],
      difficulty: json['difficulty'],
      tempsTotal: json['temps_total'],
      tempsPrep: json['temps_prep'],
      tempsCuisson: json['temps_cuisson'],
      etapes: json['etapes'].toList(),
      ingredients: json['ingredients']
          .map((ingredient) => Ingredient.fromJson(ingredient))
          .toList(),
    );
  }
}
