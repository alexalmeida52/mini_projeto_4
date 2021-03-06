import 'package:mini_projeto_4/components/settings_item.dart';
import 'package:mini_projeto_4/components/shopping_cart_item.dart';
import 'package:mini_projeto_4/data/dummy_data.dart';
import 'package:mini_projeto_4/model/lista_de_pedidos.dart';
import 'package:mini_projeto_4/model/product.dart';
import 'package:mini_projeto_4/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_list.dart';

class SettingsList extends StatefulWidget {
  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ProductList>(builder: (context, produtos, child) {
      return ListView.separated(
              shrinkWrap: true,
              itemCount: produtos.getProducts().length,
              itemBuilder: (context, index) {
                return SettingItem(produtos.getProducts()[index], index);
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
