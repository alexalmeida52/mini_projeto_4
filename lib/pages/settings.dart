import 'package:mini_projeto_4/components/settings_list.dart';
import 'package:mini_projeto_4/components/shopping_cart_list.dart';
import 'package:mini_projeto_4/model/lista_de_pedidos.dart';
import 'package:mini_projeto_4/model/pedido.dart';
import 'package:mini_projeto_4/model/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final produtos = Provider.of<ProductList>(context).getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body:  Column(
        children: [
          if(!produtos.isEmpty) 
            Flexible(child: SettingsList()) 
          else Center(child: Text('Nenhum produto adicionado')),
        ],
      )
    );
  }
}
