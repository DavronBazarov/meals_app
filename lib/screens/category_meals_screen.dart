import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
   final List<Meal> availableMeal;
   const CategoryMealsScreen(this.availableMeal, {super.key});
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitDate = false;
  @override
  void didChangeDependencies() {
    if(!_loadedInitDate){
      final routeArgs =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals =
          DUMMY_MEALS.where((meal) => meal.categories!.contains(categoryId)).toList();
      _loadedInitDate = true;
    }
    final routeArgs =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals =
        widget.availableMeal.where((meal) => meal.categories!.contains(categoryId)).toList();
    _loadedInitDate = true;
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
setState(() {
  displayedMeals?.removeWhere((meal) => meal.id == mealId);
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemCount: displayedMeals?.length,
          itemBuilder: (context, index) {
        return  MealItem(
            id: displayedMeals?[index].id ?? '',
            title: displayedMeals?[index].title ?? "",
            imgUrl: displayedMeals?[index].imageUrl ?? "",
            duration: displayedMeals?[index].duration ?? 10 ,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
        );
      }),
    );
  }
}
