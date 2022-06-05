import 'package:mini_projeto_4/model/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartItem extends StatelessWidget {
  final Pedido _pedido;

  ShoppingCartItem(this._pedido);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                //bordas na imagem
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  _pedido.product.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                //só funciona no contexto do Stack - posso posicionar o elemento
                right: 10,
                bottom: 20,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    _pedido.product.title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true, //quebra de lina
                    overflow: TextOverflow.fade, //case de overflow
                  ),
                ),
              ),
              if (false)
                Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // showModalBottomSheet<void>(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return SingleChildScrollView(
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Column(
                            //           children: [
                            //             Text(
                            //               _pedido.titulo,
                            //               style: TextStyle(
                            //                   fontSize: 26,
                            //                   color: Colors.purple,
                            //                   fontWeight: FontWeight.bold),
                            //             ),
                            //             Container(
                            //                 child: LugarForm(_pedido, index)),
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // );

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //       content: Text(
                            //     'Lugar atualizado com sucesso!',
                            //     textAlign: TextAlign.center,
                            //   )),
                            // );
                          },
                          child: Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // final lugaresProvider =
                            //     context.read<LugaresProvider>();
                            // lugaresProvider.remove_pedido(index);

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //       content: Text(
                            //     'Lugar removido com sucesso!',
                            //     textAlign: TextAlign.center,
                            //   )),
                            // );
                          },
                          child: Icon(Icons.close),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    )),
            ]),
            //Text(_pedido.titulo),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Preço: R\$ ${_pedido.product.price}'),
                      Text('Quantidade: ${_pedido.qty}'),
                    ],
                  ),
                  Text('Total: R\$ ${_pedido.getPriceProductsRequest()}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
