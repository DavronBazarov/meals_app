import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
   const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(child: Text("The favorites"),);
    }
    else{
      return ListView.builder(
          itemCount: favoriteMeals?.length,
          itemBuilder: (context, index) {
            return  MealItem(
              id: favoriteMeals?[index].id ?? '',
              title: favoriteMeals?[index].title ?? "",
              imgUrl: favoriteMeals?[index].imageUrl ?? "",
              duration: favoriteMeals?[index].duration ?? 10 ,
              complexity: favoriteMeals![index].complexity,
              affordability: favoriteMeals![index].affordability,
              );
          });
    }
    return const Scaffold(body: Center(child: Text("The favorites"),),);
  }
}
