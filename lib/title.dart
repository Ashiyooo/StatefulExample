import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget{
  final String name;
  final String location;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey[500]
                    ),
                  )
                ]
              ),
            ),
        Icon(
          Icons.add_alert_outlined,
          color: Colors.red[500],
          ),
        const Text(
          '60 enrolled'
          ),
        ],
      )
    ); 
  }
}