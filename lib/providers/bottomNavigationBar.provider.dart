import 'package:flutter/material.dart';
import 'package:ifood_flutter/core/model/pesquisa.model.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  bool _search  = true;

  PesquisaModel _pesquisaModel = PesquisaModel();

  get currentIndex => _currentIndex;

  get search => _search;

  get pesquisaModel => _pesquisaModel;


  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

 set search(bool search) {
    _search = search;
    notifyListeners();
  }

   set pesquisaModel(PesquisaModel pesquisaModel) {
    _pesquisaModel = pesquisaModel;
    notifyListeners();
  }
  
}