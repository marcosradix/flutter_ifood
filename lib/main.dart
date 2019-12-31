import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_flutter/containers/home.dart';
import 'package:ifood_flutter/core/model/main.dart';
import 'package:ifood_flutter/providers/bottomNavigationBar.provider.dart';
import 'package:ifood_flutter/providers/counter.provider.dart';
import 'package:provider/provider.dart';

final List<CardImageItem> banners = [
  CardImageItem(image: 'assets/images/camarao-vermelho.jpg', text: 'Confira sua entrega grátis na sacola'),
  CardImageItem(image: 'assets/images/ostra.jpg', text: 'A taxa é corterisa para voce'),
  CardImageItem(image: 'assets/images/salmao.jpg', text: 'Faça seu prato em casa'),
  CardImageItem(image: 'assets/images/lagosta.jpg', text: 'Peça e receba em casa'),
];

final List<CardImageItem> categories = [
  CardImageItem(image: 'assets/images/camarao-vermelho.jpg', text: 'Camarão'),
  CardImageItem(image: 'assets/images/lagosta.jpg', text: 'Lagosta'),
  CardImageItem(image: 'assets/images/ostra.jpg', text: 'Ostra'),
  CardImageItem(image: 'assets/images/salmao.jpg', text: 'Peixe'),
  CardImageItem(image: 'assets/images/arraia.jpg', text: 'Arraia'),
];

final List<BottomNavigatorItem> menus = [
  BottomNavigatorItem(icon: Icons.home, text: 'Início'),
  BottomNavigatorItem(icon: Icons.search, text: 'Busca'),
  BottomNavigatorItem(icon: Icons.receipt, text: 'Pedidos'),
  BottomNavigatorItem(icon: Icons.person_outline, text: 'Perfil'),
];

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
      ],
    child: Home(menus: menus, categories: categories, banners: banners)
    ));


}
