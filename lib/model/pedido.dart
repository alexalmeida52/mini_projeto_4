import 'package:mini_projeto_4/model/product.dart';

class Pedido {
  final Product product;
  int qty;

  Pedido({required this.product, required this.qty});

  double getPriceProductsRequest() {
    return qty * product.price;
  }

  setQty(qtd) {
    qty = qtd;
  }
}
