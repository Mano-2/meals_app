import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

// in riverpod we dont use add remove / editing a list we create a new list with the past and added components

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggoleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite =
        state.contains(meal); // whether the mealIsfavorite contain meal
    if (mealIsFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false; // wanna keep the element inside state if it does not equal the meal id because it was not favorite and now toggled on to the list
      //therefore removing the element id that equals the meal id because the meal would be in the favoritelist and toggled off instead of on
    } else {
      // here we add the meal to the empty list and take the added meals before using the spread ...
      state = [...state, meal];
      return true; // adding the meals to the state which is a list of meals
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  // its important to add the generic type for the statenotifire provider
  return FavoriteMealNotifier();
});
