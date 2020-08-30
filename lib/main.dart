import 'package:flutter/material.dart';

/*Executavel da aplicação*/
void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

/*Junto a classe _HomeState possibilita redesenhar a tela em tempo real*/
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/*Junto a classe Home possibilita redesenhar a tela em tempo real*/
class _HomeState extends State<Home> {
  /*Variaveis globais*/
  int _people = 0;
  String _infoText = 'Pode Entrar!';

  /*Função que gerencia as mensagens de acordo com o estado da aplicação*/
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Mundo Invertido?!";
      } else if (_people <= 10) {
        _infoText = 'Pode Entrar!';
      } else {
        _infoText = 'Lotado!';
      }
    });
  }
  /*Verifica se algo na tela foi alterado e muda somento o item modificado*/
  @override
  Widget build(BuildContext context) {
    /*Adciona um Stack para sobrepor widgets*/
    return Stack(
      /*Adciona filhos ao widgets Stack*/
      children: <Widget>[
        /*Chamada da imagem de fundo preenchendo toda a tela */
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),

        /*Coluna de conteudo*/
        Column(
          /*Centraliza conteudos*/
          mainAxisAlignment: MainAxisAlignment.center,
          /*Adciona filhos ao widgets Column*/
          children: <Widget>[
            /*Adiciona um Row*/
            Row(
              /*Centraliza conteudos*/
              mainAxisAlignment: MainAxisAlignment.center,
              /*Adciona filhos ao widgets Column*/
              children: <Widget>[
                /*Adciona um texto formatado*/
                Text(
                  "Pessoas: $_people",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            /*Adiciona um Row*/
            Row(
              /*Centraliza conteudos*/
              mainAxisAlignment: MainAxisAlignment.center,
              /*Adciona filhos ao widgets Column*/
              children: <Widget>[
                /*Adiciona um espaçamento nas bordas do filho de Padding*/
                Padding(
                  /*Define a tamanho da borda*/
                  padding: EdgeInsets.all(10.0),
                  /*Adiciona um filho do tipo FlatButton*/
                  child: FlatButton(
                    /*Adiciona um filho do tipo Text formatado*/
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    /*Define a ação feita pelo botão ao ser precionado*/
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                /*Adiciona um espaçamento nas bordas do filho de Padding*/
                Padding(
                  /*Define a tamanho da borda*/
                  padding: EdgeInsets.all(10.0),
                  /*Adiciona um filho do tipo FlatButton*/
                  child: FlatButton(
                    /*Adiciona um filho do tipo Text formatado*/
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    /*Define a ação feita pelo botão ao ser precionado*/
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                )
              ],
            ),
            /*Adiciona um Row*/
            Row(
              /*Centraliza conteudos*/
              mainAxisAlignment: MainAxisAlignment.center,
              /*Adciona filhos ao widgets Column*/
              children: <Widget>[
              /*Adciona um texto formatado*/
                Text(
                  _infoText,
                  style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ),
              ),
            ],
            )
          ],
        )
      ],
    );
  }
}
