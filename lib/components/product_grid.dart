import 'package:f6_ecommerce/components/product_item.dart';
import 'package:f6_ecommerce/model/product.dart';
import 'package:f6_ecommerce/model/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  final bool _showOnlyFavoritos;
  ProductGrid(this._showOnlyFavoritos);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    List<Product> loadedProducts =
        widget._showOnlyFavoritos ? provider.favoriteItems : provider.items;

    Future<List<Product>> getProducts() async {
      final response = await provider.fetchProducts();
      loadedProducts = widget._showOnlyFavoritos ? provider.favoriteItems : provider.items;
      return loadedProducts;
    }

    return FutureBuilder<List<Product>>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: loadedProducts.length,
              //# ProductItem vai receber a partir do Provider
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                //create: (ctx) => Product(),
                value: loadedProducts[i],
                //child: ProductItem(product: loadedProducts[i]),
                child: ProductItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //2 produtos por linha
                childAspectRatio: 3 / 2, //diemnsao de cada elemento
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
