import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_27/models/food_model.dart';
import 'package:section_27/views/food_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final foodViewModel = Provider.of<FoodViewModel>(context, listen: false);
      await foodViewModel.getFood();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: Consumer<FoodViewModel>(
        builder: (context, value, child) {
          if (value.state == FoodViewState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.state == FoodViewState.ready) {
            return listFood(value.foods);
          }
          return const Center(child: Text('Error Happen'));
        },
      ),
    );
  }

  Widget listFood(List<Food> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index].name;
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              foods[index].name[0],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(foods[index].name),
        );
      },
    );
  }
}
