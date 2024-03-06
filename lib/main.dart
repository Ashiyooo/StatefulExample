import 'package:flutter/material.dart';
import 'package:gesture1/buttonSection.dart';
import 'package:gesture1/clickableContainer.dart';
import 'package:gesture1/textBody.dart';
import 'title.dart';

const String bodyOfText = """
This is a 3-unit course that will discuss programming technologies, design and development related to mobile applications; Accessing device capabilities, industry standards, operating systems, and programming for mobile applications. After completion of the course, the student should be able to:
Understand, differentiate, and analyze the best approach in Mobile Development of either Native, Cross-platform, Hybrid-Web App, or Progressive Web-App for particular scenarios; Build cross-platform mobile applications; Deploy built mobile applications to App Stores;
""";
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.deepOrange,
                    ),
                  ),
                ]
              ),
              
              const TitleSection(
                name: 'CMSC 156', 
                location: 'CL4'
              ),
              const buttonSection(),
              const Padding(
                padding: EdgeInsets.all(15.0), 
                child: TextBody(text: bodyOfText)
              ),
              ClickableContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
