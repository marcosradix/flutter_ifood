import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:ifood_flutter/core/model/pesquisa.model.dart';
import 'package:ifood_flutter/providers/bottomNavigationBar.provider.dart';
import 'package:provider/provider.dart';


class BuscaPage extends StatefulWidget {
  @override
  _BuscaPageState createState() => _BuscaPageState();
}

class _BuscaPageState extends State<BuscaPage> {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    BuildContext context;
    int _counter = 0;
    String pesquisa = "";
    SearchBar searchBar;
    BottomNavigationBarProvider provider;
    final myController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
  }

  void onSubmitted(String value) {
    this.pesquisa = value.toLowerCase();  
    var pesquisaModel = PesquisaModel();
    pesquisaModel.page = 0;
    pesquisaModel.value = this.pesquisa;
    this.provider.currentIndex = 0;
    this.provider.pesquisaModel = pesquisaModel;
    setState(() => _scaffoldKey.currentState.showSnackBar(
         SnackBar(content: Text('Você escreveu $value!'))));
        _incrementCounter();
  }
 @override
  void initState() {
    searchBar =  SearchBar(
        inBar: true,
        hintText: "Pesquisar item",
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        controller: myController,
        onSubmitted: onSubmitted);
    super.initState();
  }

    AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("IFish"),
      actions: [
        searchBar.getSearchAction(context)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    this.provider = Provider.of<BottomNavigationBarProvider>(context);

      return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueAccent,
      appBar: this.searchBar.build(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Encontrado $pesquisa',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}