import 'package:f6_ecommerce/components/shopping_cart_list.dart';
import 'package:f6_ecommerce/model/lista_de_pedidos.dart';
import 'package:f6_ecommerce/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final listaDePedidos = Provider.of<ListaDePedidos>(context).getPedidos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carrinho'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        if (listaDePedidos.length > 0)
          Flexible(child: ShoppingCartList())
        else
          Center(child: Text('Não há nada aqui')),
        if (listaDePedidos.length > 0)
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Valor total: ",
                style: TextStyle(fontSize: 26, color: Colors.white),
                softWrap: true, //quebra de lina
                overflow: TextOverflow.fade, //case de overflow
              ),
              Consumer<ListaDePedidos>(builder: (context, pedidos, child) {
                return Text(
                  'R\$${pedidos.getAmountPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                  softWrap: true, //quebra de lina
                  overflow: TextOverflow.fade, //case de overflow
                );
              })
            ],
          ),
        ),
      ]),
    );
  }
}
