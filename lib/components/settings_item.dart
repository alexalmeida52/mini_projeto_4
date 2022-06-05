import 'package:mini_projeto_4/model/pedido.dart';
import 'package:mini_projeto_4/model/product.dart';
import 'package:mini_projeto_4/model/product_list.dart';
import 'package:mini_projeto_4/pages/product_form_page.dart';
import 'package:mini_projeto_4/pages/settings_form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItem extends StatelessWidget {
  final Product _product;
  final int index;

  SettingItem(this._product, this.index);

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
                  _product.imageUrl,
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
                    _product.title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true, //quebra de lina
                    overflow: TextOverflow.fade, //case de overflow
                  ),
                ),
              ),
              Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: SettingsFormPage(_product, index),
                                        // child: SettingsFormPage(_product, index)),
                                    ),
                                  ),
                                );
                              },
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                'Lugar atualizado com sucesso!',
                                textAlign: TextAlign.center,
                              )),
                            );
                          },
                          child: Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final produtoListProvider =
                                context.read<ProductList>();
                            produtoListProvider.remove_product(_product.id, index);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                'Produto removido com sucesso!',
                                textAlign: TextAlign.center,
                              )),
                            );
                          },
                          child: Icon(Icons.close),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    )),
            ]),
            //Text(_product.titulo),
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
                      Text('Preço: R\$ ${_product.price}')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
