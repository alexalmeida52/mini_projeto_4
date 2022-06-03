import 'package:f6_ecommerce/components/shopping_cart_list.dart';
import 'package:f6_ecommerce/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carrinho'),
      ),
      body: Column(children: [
        Flexible(child: ShoppingCartList()),
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
              Text("R\$500,99",
                style: TextStyle(fontSize: 26, color: Colors.white),
                softWrap: true, //quebra de lina
                overflow: TextOverflow.fade, //case de overflow
              )
            ],
          ),
        ),
      ]),
    );
  }
}
