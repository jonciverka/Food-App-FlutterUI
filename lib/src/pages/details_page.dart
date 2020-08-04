import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  Map  args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(args["comida"]),
          Container(
            color: Colors.black38,
          ),
          _cuerpo(args["nombreComida"],args["comida"] ),
          _boton()
        ],
      ),
    );
  }
  Widget  _fondo(String comida){
    return Image(
      image: AssetImage(
        comida
      ),
      height:double.infinity ,
      fit: BoxFit.cover, 
      alignment: Alignment(-.5,0),
       
    );
  }
  Widget _cuerpo(String nombreComida, String comida){
    return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _menu(),
          _descripcion(nombreComida),
          _previewImagen(comida),
        ],
      ),
    );
  }
  Widget _menu(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.arrow_back, color: Colors.white, size: 30,),
          Icon(Icons.search, color: Colors.white, size: 30,)
        ],
      ),
    );
  }
  Widget _descripcion(String nombreComida){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:30.0,horizontal: 50),
      child: Container(
          width: double.infinity,
          height: 200,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(nombreComida, style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ornare vel nunc ut convallis. Suspendisse bibendum ante non suscipit pellentesque. ",
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100),)
              ],
            ),
          ),
      ),
    );
  }
  Widget _previewImagen(String comida){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          image: AssetImage(comida),
          fit: BoxFit.cover,
          height: 400,
          width: 230,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.whatshot, color: Colors.white,size: 30,),
                  Text("120", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.traffic, color: Colors.white,size: 30,),
                  Text("120", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
  Widget _boton(){
    return Positioned(
      bottom: 30,
      right: 30,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.orange,
        onPressed: (){

        },
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        child: Row(
          children: <Widget>[
            Text("Add to cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),)   ,
            SizedBox(width: 10,),
            Icon(Icons.shopping_basket, color: Colors.white,)         
          ],
        ),
      ),
    );
  }
}