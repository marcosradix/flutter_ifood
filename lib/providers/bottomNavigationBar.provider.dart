import 'package:flutter/material.dart';
import 'package:ifood_flutter/core/model/pesquisa.model.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  PesquisaModel _pesquisaModel = PesquisaModel();

  get currentIndex => _currentIndex;

  get pesquisaModel => _pesquisaModel;


  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

   set pesquisaModel(PesquisaModel pesquisaModel) {
    _pesquisaModel = pesquisaModel;
    notifyListeners();
  }
  
}