
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: Stack(
        children: <Widget>[
          _fondo(),
          _degradadoNegro(),
          _cuerpo(context),
         
        ],
      ),
    );
  }
  Widget _fondo(){
    return ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80), bottomRight: Radius.circular(80)),
        child: Image(
        image: AssetImage('assets/comida-rapida-casera.jpg'),
        height: 350,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget _degradadoNegro(){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.transparent
          ]
        ),
      ),
    );
  }
  Widget _cuerpo(BuildContext context){
    return Column(
      children: <Widget>[
        _menu(),
        _titulo(),  
        _categorias(),
        _descuentos(context),

      ],
    );
  }
  Widget _menu(){
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.menu, color: Colors.white, size: 30,),
            Icon(Icons.search, color: Colors.white, size: 30,)  
          ],
      ),
        ),
    );
  }
  Widget _titulo(){
    return Container(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Choose the food", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
          Text("you like", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
  Widget _categorias(){
    return Container(
      height: 300,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: .5
        ),
        children: <Widget>[
         _tarjetaMenu("SeaFoods", "Fish, Prawn, Crabs, Octupus...","assets/seafood.png"),
         _tarjetaMenu("Spaghetti","Macaroni, Pasta, Lasagna...","assets/spaguetti.png"),
         _tarjetaMenu("Vegetables","Lettuce, Carrot, Spinach...","assets/salad.png"),
         _tarjetaMenu("Chicken","Chicken, Duck...","assets/chicken.png"),
         _tarjetaMenu("Soup","Mushroom, Barley and wheat...","assets/soup.png"),
        ],
      ),
    );
  }
  Widget _tarjetaMenu(String titulo, String comidas, String imagen){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,      
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Image(image: AssetImage(imagen),height: 120,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: Text(titulo, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: Text(comidas, style: TextStyle(color: Colors.black26, fontSize: 15, fontWeight: FontWeight.bold),),
          ),
          Expanded(child: Container(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15),
            child: Text("types of food", style: TextStyle(color: Colors.orangeAccent, fontSize: 15, fontWeight: FontWeight.bold),),
          ),
          
        ],
      ),
    );
  }
  
  Widget _descuentos(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Image(image: AssetImage('assets/ticket.png'),width: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text("Cheaper", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("See all", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),),
                )
              ],
            )            
          ],          
        ),
        Table(
          children: [
            TableRow(
              children: [
                _carta('assets/ensalada-griega.jpg',"Parsley Spaghetti", context),
                _carta('assets/tacos.jpg',"Tacos", context)
              ]
            )
          ],
        )

      ],
    );
  }
  Widget _carta(String comida, String nombreComida, BuildContext context){
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "detalles", arguments: {"comida": comida, "nombreComida": nombreComida});
        },
        child: Container(
        padding: EdgeInsets.symmetric(vertical:10, horizontal: 15),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
             children: <Widget>[
               ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                  image: AssetImage(comida),
                  width: double.infinity,
                  fit: BoxFit.cover,  
                  height: 98,         
                 ),
               ),
               Positioned(
                 right: 10,
                 top: 10,
                 child: CircleAvatar(
                   radius: 15,                 
                   backgroundColor: Colors.orange,
                   child: Text("450", style: TextStyle(color: Colors.white, fontSize: 10),),
                 ),
               )
             ], 
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(nombreComida, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}