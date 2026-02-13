import 'package:fixem/routes/routes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(          
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FIXEM", style: TextStyle
            (
              fontSize: 30,
              color:Colors.black,
              fontFamily: 'Moulpali',           
            ),
            
            ),
           SizedBox(
            width: 121,
            height: 261,
            child: Image(image: AssetImage('assets/Images/Office.png')),

           ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor:Colors.white,
                minimumSize:Size(300, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              child: Text('Get Started'),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManger.registerpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
