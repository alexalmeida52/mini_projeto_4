import 'package:f6_ecommerce/model/lista_de_pedidos.dart';
import 'package:f6_ecommerce/model/product_list.dart';
import 'package:f6_ecommerce/pages/product_detail_page.dart';
import 'package:f6_ecommerce/pages/product_form_page.dart';
import 'package:f6_ecommerce/pages/products_overview_page.dart';
import 'package:f6_ecommerce/pages/settings.dart';
import 'package:f6_ecommerce/pages/shopping_cart_page.dart';
import 'package:f6_ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListaDePedidos>(
          create: (_) => ListaDePedidos(),
        ),
        ChangeNotifierProvider<ProductList>(
          create: (_) => ProductList(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
            fontFamily: 'Lato',
            //primarySwatch: Colors.pink,
            colorScheme: ThemeData().copyWith().colorScheme.copyWith(
                primary: Colors.pink, secondary: Colors.orangeAccent)),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormPage(),
          AppRoutes.SHOPPING_CART: (context) => ShoppingCartPage(),
          AppRoutes.SETTINGS: (context) => SettingsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
