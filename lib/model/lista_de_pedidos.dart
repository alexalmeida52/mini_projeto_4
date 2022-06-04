import 'package:f6_ecommerce/model/pedido.dart';
import 'package:f6_ecommerce/model/product.dart';
import 'package:flutter/cupertino.dart';

class ListaDePedidos with ChangeNotifier {
  List<Pedido> listaDePedidos = [];

  static get dummyProducts => null;

  List<Pedido> getPedidos() {
    return listaDePedidos;
  }

  setPedidos(List<Pedido> ls) {
    listaDePedidos = ls;
  }

  double getAmountPrice() {
    return listaDePedidos
        .map((pedido) => pedido.getPriceProductsRequest())
        .reduce((value, element) => value + element);
  }

  adicionarPedido(Product product) {
    bool produtoJaEstaNoCarrinho = false;
    for (var i = 0; i < listaDePedidos.length; i++) {
      if (listaDePedidos[i].product.id == product.id) {
        listaDePedidos[i].qty += 1;
        produtoJaEstaNoCarrinho = true;
        break;
      }
    }
    if (!produtoJaEstaNoCarrinho) {
      listaDePedidos.add(Pedido(product: product, qty: 1));
    }
    print('Produto adicionado: ${product.title}');
    notifyListeners();
  }

  Pedido getPedidoByProductId(id) {
    return listaDePedidos.where((element) => element.product.id == id).toList()[0];
  }
}
