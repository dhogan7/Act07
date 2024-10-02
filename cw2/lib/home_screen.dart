import 'package:flutter/material.dart';
import 'detailsscreen.dart';
class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Buffalo Wings',
      'ingredients': "2 lbs chicken wings 1/2 cup all-purpose flour (optional for crispier wings) 1/4 cup butter (melted) 1/2 cup hot sauce (e.g., Frank's RedHot) 1 tsp garlic powder 1 tsp paprika (optional) Salt and pepper to taste Vegetable oil (for frying or baking)",
      'instructions': "Pat the chicken wings dry with paper towels. Season with salt, pepper, and paprika (optional). For extra crispiness, toss the wings in flour to coat lightly. Heat about 2 inches of vegetable oil in a large pot or deep pan to 350°F (175°C). Fry the wings in batches for about 8-10 minutes, until crispy and golden brown. Remove from oil and let them drain on paper towels. Place the cooked wings in a large bowl. Pour the Buffalo sauce over the wings and toss them until they're well coated."
    },
    {
      'name': 'Pasta Salad',
      'ingredients': "2 cups pasta (rotini, penne, or your choice), 1/2 cup cucumber (diced), 1/4 cup red onion (thinly diced), 1/2 cup tomatoes (diced), 1/4 cup Italian dressing (store-bought or homemade), Salt and pepper to taste, and Fresh basil or parsley (optional for garnish)",
      'instructions': "Bring a large pot of salted water to a boil. Add the pasta and cook according to the package instructions (usually 8-10 minutes). Drain and rinse the pasta under cold water to cool it down. While the pasta is cooking, chop the tomatoes, cucumber, red onion, bell peppers, and olives. Add the cooked and cooled pasta to a large bowl and then add the other ingredients. Last, mix carefully as to spread eaverything out evenly. "
    },
    {
      'name': 'Bar Brownies',
      'ingredients': '6 x 53g Mars bars, chopped, 100g butter, chopped, 3 eggs, lightly whisked, 75g (1/2 cup) self-raising flour, 50g (1/2 cup) cocoa powder',
      'instructions': 'Preheat the oven to 160°C/140°C fan forced. Grease a square 18cm cake pan and line the base with baking paper, extending up 2 sides. Combine the chopped Mars bars and butter in a heatproof bowl and stand the bowl over a pan of simmering water (don’t let the bowl touch the water). Heat, stirring occasionally, until the butter and chocolate have melted but lumps of nougat remain. Remove from the heat and set aside to cool slightly. Add the egg to the chocolate mixture and stir to combine. Sift in the flour and cocoa powder. Fold to combine. Transfer the mixture to the prepared pan, smoothing the top. Bake for 30 minutes or until a skewer inserted into the middle of the brownie comes out with crumbs clinging slightly. Allow to cool in the pan for 10 minutes. Use the paper to lift the brownie from the pan and cut into squares. Serve warm or at room temperature.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      backgroundColor: const Color.fromARGB(255, 192, 52, 73),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
  
  detailsscreen({required Map<String, String> recipe}) {}
}