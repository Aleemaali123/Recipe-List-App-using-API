import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/models/recipie.api.dart';
import 'package:flutter_application_1/widgets/recipi_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Recipe> recipes;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
    recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(recipes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text('Food Recipe')
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body:_isLoading
      ? Center(
        child: CircularProgressIndicator())
        :ListView.builder(
          itemCount: recipes.length,
          itemBuilder:(context, index) {
            return RecipeCard(
              title: recipes[index].name,
               cookTime: recipes[index].totalTime, 
               rating: recipes[index].rating.toString(), 
               thumbnailUrl: recipes[index].images);
          },
          )
      );
       
    
  }
}