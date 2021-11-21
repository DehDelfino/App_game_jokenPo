
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {


  var _imageApp = AssetImage("images/padrao.png");

  String? _result = "Faça sua escolha!";




  final _images = {
    "papel" : "images/papel.png",
    "tesoura" : "images/tesoura.png",
    "pedra" : "images/pedra.png"
  };


  void _play(String optionSelected){
    final _options = ["pedra", "papel", "tesoura"];
    var random = Random().nextInt(_options.length);
    var _computerChose = _options[random];
    var imageChose = _images[_computerChose]!;


    setState(() {
      _imageApp =  AssetImage(imageChose);
    });

    //Chosing the winner
    if(_computerChose == optionSelected){

      setState(() {
        _result = "UOU EMPATE!!!";
      });
    }
    else if (_computerChose == "pedra" && optionSelected == "papel"){

      setState(() {
        _result = "Você Venceu!!!";
      });

    }
    else if (_computerChose == "papel" && optionSelected == "tesoura"){

      setState(() {
        _result = "Você Venceu!!!";
      });

    }
    else if (_computerChose == "tesoura" && optionSelected == "pedra"){

      setState(() {
        _result = "Você Venceu!!!";
      });

    }
    else{
      setState(() {
        _result = "Que pena, você perdeu :(";
      });
    }






  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
      ) ,
      body: Center(
        child: Container(
          child: Column(

            children: [
              const Padding(
                padding: EdgeInsets.only(top:32, bottom: 16),
                child: Text(
                    'Escolha do App: ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              Image(image: _imageApp),



               Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                    _result!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child:Image.asset("images/pedra.png", height: 100,) ,
                    onTap:()=>_play("pedra"),
                  ),
                  GestureDetector(
                    child:Image.asset("images/papel.png", height: 100,) ,
                    onTap:()=>_play("papel"),
                  ),
                  GestureDetector(
                    child:Image.asset("images/tesoura.png", height: 100,) ,
                    onTap: ()=>_play("tesoura"),
                  ),



                ],
              ),


            ],
          ),
        ),
      ) ,
    );
  }
}
