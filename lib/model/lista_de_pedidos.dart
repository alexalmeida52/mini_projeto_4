import 'package:f6_ecommerce/model/pedido.dart';
import 'package:flutter/cupertino.dart';

class ListaDePedidos extends ChangeNotifier {
  List<Pedido> listaDePedidos = [
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

  static get dummyProducts => null;

  List<Pedido> getPedidos() {
    return listaDePedidos;
  }

  getAmountPrice() {
    return listaDePedidos
        .map((pedido) => pedido.getPriceProductsRequest())
        .reduce((value, element) => value + element);
  }
}
