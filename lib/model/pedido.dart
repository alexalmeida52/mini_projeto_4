import 'package:f6_ecommerce/model/product.dart';

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
