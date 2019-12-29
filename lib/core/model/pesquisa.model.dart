class PesquisaModel{
    String _value;
    int _page;
    List<dynamic> _data;

  String get value => _value;
  set value(String value) {
    this._value = value;
  }

  int get page => _page;
  set page(int page) {
    this._page = page;
  }

  List<dynamic> get data => _data;
  set data(List<dynamic> data) {
    this._data = data;
  }

    @override
    String toString() {
        return "value = $_value, page = $_page, data = $_data";
    }


}