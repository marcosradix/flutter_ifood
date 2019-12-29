import 'package:flutter/material.dart';
import 'package:ifood_flutter/providers/bottomNavigationBar.provider.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

 var provider = Provider.of<BottomNavigationBarProvider>(context);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                child: FocusScope(
                     child: Focus(
                      onFocusChange: (focus)  {
                        provider.currentIndex = 1;
                        },
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Local ou iguaria',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ),
                  ),
                                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Text(
                'Filtros',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
