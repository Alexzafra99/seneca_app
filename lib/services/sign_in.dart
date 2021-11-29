import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seneca_app/provider/email_provider.dart';
import 'package:seneca_app/services/firebase.dart';

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    final resultadosEmail = Provider.of<EmailProvider>(context);
    
    bool emailCorrecto = false;
    
    return !isLoading
        ? Container(
            margin: EdgeInsets.only(top: 10),
            width: 300,
            height: 60,
            child: OutlinedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = new FirebaseService();
                try {
                  await service.signInWithGoogle();
                  print(user!.email);
                  for(int i=0; i<resultadosEmail.resultados.length; i++){
                    if(user.email==resultadosEmail.resultados[i].email){
                      emailCorrecto = true;
                    }
                  }

                  if(emailCorrecto){                   
                    Navigator.pushNamed(context, "home_screen");
                  }
                  else{
                    Navigator.pushNamed(context, "loginFireBase_screen");

                    AlertDialog(
                      title: Text("Usuario sin permiso"),
                      content: Text("Intenta acceder con otro usuario"),
                      actions: [
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );

                    await service.signOutFromGoogle();
                  }

                } catch (e) {
                  if (e is FirebaseAuthException) {
                    print(e.message!);
                  }
                  if (e is PlatformException) {
                    print("No se ha seleccionado usuario");
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: Text(
                "Acceder con cuenta de Google",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : Column(
            children:[
              CircularProgressIndicator(),
              SizedBox(height: 34)
            ]
          );
  }
}