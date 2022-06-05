import 'package:mini_projeto_4/components/shopping_cart_item.dart';
import 'package:mini_projeto_4/data/dummy_data.dart';
import 'package:mini_projeto_4/model/lista_de_pedidos.dart';
import 'package:mini_projeto_4/model/product.dart';
import 'package:mini_projeto_4/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_list.dart';

class ShoppingCartList extends StatefulWidget {
  @override
  State<ShoppingCartList> createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {

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
