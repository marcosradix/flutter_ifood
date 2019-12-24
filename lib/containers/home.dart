import 'package:flutter/material.dart';
import 'package:ifood_flutter/containers/widgets/main.dart';
import 'package:ifood_flutter/core/model/main.dart';
import 'package:ifood_flutter/core/scrrens/pedidos.page.dart';
import 'package:ifood_flutter/providers/bottomNavigationBar.provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final List<CardImageItem> categories;
  final List<BottomNavigatorItem> menus;
  final List<CardImageItem> banners;
  const Home({
    @required this.categories,
    @required this.menus,
    @required this.banners,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  final PedidosPage _pedidosPage = PedidosPage();

  List<BottomNavigationBarItem> _buildBottomIcon() => widget.menus
      .map((menu) => BottomNavigationBarItem(
            icon: Icon(menu.icon, color: Colors.black),
            title: Text(menu.text, style: TextStyle(color: Colors.black)),
          ))
      .toList();

  Widget build(context) {
 var provider = Provider.of<BottomNavigationBarProvider>(context);
    Widget _paginaSelecionada(int page) {
      switch (page) {
        case 2:
          return _pedidosPage;
        case 0:
        return homePage();
        default:
          return Center(
            child: Text("$page"),
          );
      }
    }

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      title: 'Peskado',
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: _paginaSelecionada(provider.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          key: _bottomNavigationKey,
          currentIndex: provider.currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          items: _buildBottomIcon(),
          onTap: (int index) {
            provider.currentIndex = index;
          },
        ),
      ),
    );
  }

  ListView homePage() {
    return ListView(
        children: <Widget>[
          Location(),
          Search(),
          BannerSlide(items: widget.banners),
          Categories(items: widget.categories),
          GourmetRestaurants(),
        ],
      );
  }
}
