import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:seneca_app/provider/login_provider.dart';
import 'package:seneca_app/services/sign_in.dart';
import 'package:seneca_app/services/sign_out.dart';

class LoginFireBaseScreen extends StatelessWidget {

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
    return Container(
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
    );
  }
}

class Content extends StatefulWidget {

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  
  String _user = "";
  String _password = "";
  
  bool _ocultarPassword = true;
  IconData _iconoPassword = Icons.visibility;

  @override
  Widget build(BuildContext context) {

    final resultadosLogin = Provider.of<LoginProvider>(context);
  
    return ListView(
      children:[ 
        Center(
        child: Column(               
          children:[
            
            SizedBox(height: 50),
            
            //Titulo
            Text(
              "iSéneca", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 110),              

            //Botón Google 
            GoogleSignIn(),
            //GoogleSignOut(),
    
            SizedBox(height: 70),

            //No recuerdo contraseña
            Text(
              "No recuerdo mi contraseña",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
    
            Divider(height: 18, color: Colors.white, indent: 77, endIndent: 77,),
          
            SizedBox(height:100),
    
            //Logo
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 5),
                  child: Image.asset(
                    "assets/logoJA.png", 
                    height: 65, 
                    width: 65,
                    color: Colors.white,
                  ),
                ),
    
                //Texto Junta Andalucía
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
    
            //Versión
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              alignment: Alignment.bottomRight,
              child: Text("v11.3.0", 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ], 
        ),
      ),
      ]
    );     
  }
}