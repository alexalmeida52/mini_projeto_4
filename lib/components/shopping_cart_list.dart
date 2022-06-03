import 'package:f6_ecommerce/components/shopping_cart_item.dart';
import 'package:f6_ecommerce/data/dummy_data.dart';
import 'package:f6_ecommerce/model/product.dart';
import 'package:f6_ecommerce/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartList extends StatelessWidget {
  final List<Pedido> _productsRequestList = [
    Pedido(product: dummyProducts[0], qty: 2),
    Pedido(product: dummyProducts[1], qty: 3),
    Pedido(product: dummyProducts[3], qty: 6),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
    Pedido(product: dummyProducts[2], qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return _productsRequestList.isEmpty
        ? Text('Não há nada aqui')
        : ListView.separated(
            shrinkWrap: true,
            itemCount: _productsRequestList.length,
            itemBuilder: (context, index) {
              return ShoppingCartItem(_productsRequestList[index]);
            },
            padding: const EdgeInsets.all(8),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
          );
  }
}
