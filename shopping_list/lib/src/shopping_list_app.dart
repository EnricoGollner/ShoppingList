import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/src/bloc/shopping_bloc.dart';
import 'package:shopping_list/src/data/repositories/shopping_repository.dart';
import 'package:shopping_list/src/pages/home_page.dart';

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        useMaterial3: false,
      ),
      home: MultiProvider(
        providers: [
          Provider<ShoppingRepository>(
            create: (context) => ShoppingRepository(),
          ),
          Provider<ShoppingBloc>(
            create: (context) => ShoppingBloc(
                shoppingRepository: context.read<ShoppingRepository>()),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
