import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatelessWidget {

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
      
      //BottomNavigationBar
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          color: Color(0xff005298)
        ),
        Container(
          color: Colors.white
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: 5),
              
              //Titulo
              Text(
                "iSéneca",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 10),

              //Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 100,
                width: 330,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Zafra Romero, Alejandro", 
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 60),
                        Icon(Icons.arrow_drop_down),
                        Icon(Icons.people, size: 20)
                      ],
                    ),
                    
                    SizedBox(height: 8,),
                    
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("I.E.S Jándula",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),

                            Text("Perfil Dirección",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5), 
                    bottomRight: Radius.circular(5)
                  ),
                  color: Colors.blue
                ),

                child: Row(
                  children: [
                    SizedBox(width: 45),
                    Icon(Icons.alarm, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Avisos",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 38),
                    VerticalDivider(
                      color: Colors.white, 
                      indent: 8,
                      endIndent: 8,
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.book_outlined, color: Colors.white), 
                    SizedBox(width: 7),
                    Text("Bandeja de firmas",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),

              //Table
              Container(
                margin: EdgeInsets.all(15),
                child: Table(
                  border: TableBorder(
                    verticalInside: BorderSide(
                      width: 1.5,
                      color: Color(0xffeeeeee),
                    ),
                    horizontalInside: BorderSide(
                      width: 1.5,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  children: [
                    TableRow(
                      children: [
                        _SingleCard(icon: "assets/sombrero.png", text: "Alumnado del centro"),
                        _SingleCard(icon: "assets/profesor.png", text: "Personal del centro"),
                        _SingleCard(icon: "assets/covid.png", text: "Información Covid")                      
                      ]
                    ),
                    TableRow(
                      children: [
                        _SingleCard(icon: "assets/campana.png", text: "Tablón de anuncios"),
                        _SingleCard(icon: "assets/calendario.png", text: "Calendario escolar"),
                        _SingleCard(icon: "", text: "")                      
                      ]
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final String icon;
  final String text;

  const _SingleCard({
    Key? key, 
    required this.icon, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(icon=="") {
        return Container();
    } 
    else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
        child: Column(
          children: [
          
            Container(
              height: 44,
              width: 45,
              child: Image.asset(this.icon),           
            ),
            SizedBox(height: 10),
            Text(this.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      selectedItemColor: Color(0xff005298),
      unselectedItemColor: Color(0xffbcbcbc),
      showUnselectedLabels: true,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Inicio"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_toggle_off),
          label: "Agenda"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger_outline_rounded),
          label: "Comunicaciones"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Menú"
        ),
      ]
    );
  }
}

