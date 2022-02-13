import 'dart:convert';
import 'package:flutter_application_1/models/recipe.dart';
// import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{


static Future<List<Recipe>> getRecipe() async{
  var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',{
    	"limit": "18",
     	"start": "0",
     	"tag": "list.recipe.popular"
  });
  final Response = await http.get(uri, headers: {

     	"x-rapidapi-host": "yummly2.p.rapidapi.com",
 	"x-rapidapi-key": "38ca951abcmsh31f3984f18df97dp1ebcebjsn5a3a532c818f",
 	"useQueryString": "true"
  });

  Map data = jsonDecode(Response.body);
   List _temp = [];

   for(var i in data['feed']){
     _temp.add(i['content']['details']);
   }

   return Recipe.recipesFromSnapshot(_temp);
}

}