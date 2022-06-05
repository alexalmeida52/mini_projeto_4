import 'package:mini_projeto_4/model/lista_de_pedidos.dart';
import 'package:mini_projeto_4/model/product.dart';
import 'package:mini_projeto_4/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/lista_de_pedidos.dart';

class ProductItem extends StatelessWidget {
  /*
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  */
  @override
  Widget build(BuildContext context) {
    //PEGANDO CONTEUDO PELO PROVIDER
    //
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    final listaDePedidos = Provider.of<ListaDePedidos>(context);

    //final product = context.watch<Product>();

    var isFavorite =
        context.select<Product, bool>((produto) => produto.isFavorite);

    return ClipRRect(
      //corta de forma arredondada o elemento de acordo com o BorderRaius
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              //adicionando metodo ao clique do botão
              product.toggleFavorite();
            },
            //icon: Icon(Icons.favorite),
            //pegando icone se for favorito ou não
            icon: Consumer<Product>(
              builder: (context, product, child) => Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            //isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {
                product.toggleCartForTrue();
                listaDePedidos.adicionarPedido(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    '${listaDePedidos.getPedidoByProductId(product.id).qty} itens adicionados ao carrinho!',
                    textAlign: TextAlign.center,
                  )),
                );
              },
              icon: Consumer<Product>(
                builder: (context, product, child) => Icon(product.isCart
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined),
              ),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
