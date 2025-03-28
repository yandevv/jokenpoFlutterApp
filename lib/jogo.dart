import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!", 
      _corRespostaFinal = Colors.black,
      _corBordaFinal = Colors.white;
  var _qtdeJogosApp = 0,
      _qtdeJogosUsuario = 0;
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);
    //Exibir na UI o resultado da escolha do APP
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //Lógica para ganhador e perdedor
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _resultadoFinal = "Parabéns! Você ganhou :)";
        _corRespostaFinal = Colors.lightBlue;
        _corBordaFinal = Colors.black;
        _qtdeJogosUsuario++;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Puxa! Você perdeu :(";
        _corRespostaFinal = Colors.redAccent;
        _corBordaFinal = Colors.black;
        _qtdeJogosApp++;
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate! Tente novamente :/";
        _corRespostaFinal = Colors.yellow;
        _corBordaFinal = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Jokenpô'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1 - Escolha do App
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          //2 - Imagem de escolha do app
          Image(image: _imagemApp),
          //3 - Escolha uma opção abaixo:
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: const Image(
                        image: AssetImage('images/pedra.png'),
                        height: 100,
                      ),
                    ),
                  ),
                  Text(
                    "Pedra",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: const Image(
                        image: AssetImage('images/papel.png'),
                        height: 100,
                      ),
                    ),
                  ),
                  Text(
                    "Papel",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: const Image(
                        image: AssetImage('images/tesoura.png'),
                        height: 100,
                      ),
                    ),
                  ),
                  Text(
                    "Tesoura",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Stack(
              children: <Widget>[
                Text(
                  _resultadoFinal,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = _corBordaFinal,
                  ),
                ),
                Text(
                  _resultadoFinal,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: _corRespostaFinal,
                  ),
                ),
              ]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vitórias do App",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "$_qtdeJogosApp",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vitórias do Usuário",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "$_qtdeJogosUsuario",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _qtdeJogosApp = 0;
                      _qtdeJogosUsuario = 0;
                      _resultadoFinal = "Boa sorte!";
                      _corRespostaFinal = Colors.black;
                      _corBordaFinal = Colors.white;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Reiniciar"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
