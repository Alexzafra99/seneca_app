import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Background(),
          //Content
          Content(),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0,0.8],
            colors: [
              Color(0xff005298),
              Color(0xff01315a)
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(               
        children:[
          
          SizedBox(height: 90,),
          
          Text(
            "iSéneca", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold
            ),
          ),
          
          SizedBox(height: 25),              
          
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(           
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff195d94),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Usuario",
                hintStyle: TextStyle(color: Colors.white),   
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff195d94),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Contraseña",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.visibility, color: Colors.white,)
              ),
            ),
          ),
          
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            child: Text("Entrar",style: TextStyle(color: Color(0xff01315a) ,fontSize: 16)),
            style: ElevatedButton.styleFrom(
              primary: Colors.white, 
              fixedSize: Size(300, 50)              
            ),             
          ),

          SizedBox(height: 50),

          Text(
            "No recuerdo mi contraseña",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),

          Divider(height: 18, color: Colors.white, indent: 77, endIndent: 77,),
        
          SizedBox(height:60),

          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 5),
                child: Image.asset(
                  "assets/logoJA.png", 
                  height: 70, 
                  width: 70,
                  color: Colors.white,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Junta de Andalucía", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7),
                  Text("Consejería de Educación y Deporte",
                    style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 20, right: 10),
            alignment: Alignment.bottomRight,
            child: Text("v11.3.0", 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ], 
      ),
    );     
  }
}