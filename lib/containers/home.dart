import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ifood_flutter/containers/widgets/main.dart';
import 'package:ifood_flutter/core/model/estabelecimento.model.dart';
import 'package:ifood_flutter/core/model/main.dart';
import 'package:ifood_flutter/core/scrrens/busca.page.dart';
import 'package:ifood_flutter/core/scrrens/pedidos.page.dart';
import 'package:ifood_flutter/core/scrrens/perfil.page.dart';
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
  final PerfilPage _perfilPage = PerfilPage();
  final BuscaPage _buscaPage = BuscaPage();
  BottomNavigationBarProvider provider;
  List<Estabelecimento> estabelecimentos = [
    new Estabelecimento("Casa do peixe",10, 50),
    new Estabelecimento("Casa da lagosta", 15, 60),
    new Estabelecimento("Casa do camarão", 20,  40)
  ];
  List<Estabelecimento> estabelecimentosEncontrados = [];

@override
  void initState() {
    estabelecimentosEncontrados = estabelecimentos;
    super.initState();
  }
  List<BottomNavigationBarItem> _buildBottomIcon() => widget.menus
      .map((menu) => BottomNavigationBarItem(
            icon: Icon(menu.icon, color: Colors.black),
            title: Text(menu.text, style: TextStyle(color: Colors.black)),
          ))
      .toList();

  @override
  void didChangeDependencies() {
    if (this.provider != null && provider.currentIndex == 0 && provider.pesquisaModel.value != null) {
      var localEncontrado = this.estabelecimentos.firstWhere((item) => item.nome.toLowerCase().contains(provider.pesquisaModel.value.toLowerCase().trim()), orElse: () => null);

      if(localEncontrado == null){
        this.estabelecimentosEncontrados = estabelecimentos;
        provider.search = true;

      }else{
      this.estabelecimentosEncontrados = [];
      this.estabelecimentosEncontrados.add(localEncontrado);
        provider.search = false;

      }
      print(localEncontrado.toString());
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(context) {
  this.provider = Provider.of<BottomNavigationBarProvider>(context);

    Widget _paginaSelecionada(int page) {
      switch (page) {
        case 0:
          return homePage();
        case 1:
          return _buscaPage;
        case 2:
          return _pedidosPage;
        case 3:
          return _perfilPage;
        default:
          return Center(
            child: Text("$page"),
          );
      }
    }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'IFISH',
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: _paginaSelecionada(provider.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          key: _bottomNavigationKey,
          currentIndex: provider.currentIndex,
          type: BottomNavigationBarType.shifting,
          elevation: 4,
          items: _buildBottomIcon(),
          onTap: (int index) {
            provider.currentIndex = index;
          },
        ),
      ),
    );
  }

  GestureDetector _builderCard(int index, BuildContext context) {
    return GestureDetector(
      child: Card(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 3.0),
            child: Container(
              width: 80.0,
              height: 90.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 80,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      estabelecimentosEncontrados[index].nome ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Distância - ${estabelecimentosEncontrados[index].distancia ?? 0}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Tempo médio - ${estabelecimentosEncontrados[index].tempoMedio ?? 0}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ))
        ],
      )),
      onTap: () {
        HapticFeedback.mediumImpact();
        print(estabelecimentos[index].nome);
        // String nemNumber =
        //  contacts[index].phone.replaceAll(RegExp(r'[^\w\s]+'), '');
        // String phoneNumber = nemNumber.replaceAll(" ", "");
        //_service.call(phoneNumber);
      },
      onLongPress: () {
        HapticFeedback.mediumImpact();
        print(estabelecimentos[index].nome);
        provider.search = true;
        //  _showOptions(context, index);
      },
    );
  }

  Widget homePage() {
    return ListView(
      scrollDirection: Axis.vertical,
       shrinkWrap: true,
      children: <Widget>[
        Visibility(child: Location() ,visible: provider.search),
        Search(),
        Visibility(child:BannerSlide(items: widget.banners), visible: provider.search),
        Visibility(child:Categories(items: widget.categories),visible: provider.search),
        Visibility(child:GourmetRestaurants(),visible: provider.search),
        Visibility(child:SizedBox(height: 10.0,),visible: provider.search),
        ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 350),
            child: ListView.builder(
              padding: EdgeInsets.only(
              top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
              itemCount: this.estabelecimentosEncontrados.length,
              itemBuilder: (context, index) {
                return _builderCard(index, context);
              },
            )),
        SizedBox(height: 20.0,),

      ],
    );
  }
}
