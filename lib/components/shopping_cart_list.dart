import 'package:f6_ecommerce/components/shopping_cart_item.dart';
import 'package:f6_ecommerce/data/dummy_data.dart';
import 'package:f6_ecommerce/model/lista_de_pedidos.dart';
import 'package:f6_ecommerce/model/product.dart';
import 'package:f6_ecommerce/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_list.dart';

class ShoppingCartList extends StatefulWidget {
  @override
  State<ShoppingCartList> createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  final List<Pedido> _productsRequestList = [
    Pedido(product: dummyProducts[0], qty: 2),
    Pedido(product: dummyProducts[1], qty: 3),
    Pedido(product: dummyProducts[3], qty: 6),
    Pedido(product: dummyProducts[2], qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ListaDePedidos>(builder: (context, pedidos, child) {
      return ListView.separated(
              shrinkWrap: true,
              itemCount: pedidos.getPedidos().length,
              itemBuilder: (context, index) {
                return ShoppingCartItem(pedidos.getPedidos()[index]);
              },
              padding: const EdgeInsets.all(8),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            );
    });
  }
}
