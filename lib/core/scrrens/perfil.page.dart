import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: "assets/images/perfil.jpg",
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/perfil.jpg"))),
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                           Text(
                            "Marcos Ferreira Severino",
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          "marcosradix@gmail.com",
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                          fontFamily: 'Montserrat', 
                          color: Colors.black87),
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
