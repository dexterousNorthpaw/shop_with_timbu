import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_timbu/models/products.dart';
import 'package:shop_with_timbu/providers/products_provider.dart';
import 'package:shop_with_timbu/screens/home_view.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductsAdapter());
  // var box = await Hive.openBox("orderHistory");
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductsProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
