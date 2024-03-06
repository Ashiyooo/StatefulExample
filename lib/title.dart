import 'package:flutter/material.dart';
import 'package:gesture1/enrolledModel.dart';
import 'package:provider/provider.dart';

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
    return Padding(padding: const EdgeInsets.all(20.0),
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
        const FavoriteWidget(),
        ],
      )
    ); 
  }
}

class FavoriteWidget extends StatefulWidget{
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  Color _color = Colors.deepOrange;
  bool _isClicked = false;
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer<EnrolledModel>(
      builder: (context, value, child) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: _isClicked? Icon(Icons.add_alert, color: _color): Icon(Icons.add_alert_outlined, color: _color),
              onPressed: _toggleFavorite,
              ),
          ),
          SizedBox(
            width: 75,
            child: Text('${value.count} enrolled'),
          )
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      final model = context.read<EnrolledModel>();
      if(_isClicked){
        model.decrement();
        _isClicked = false;
      } else {
        model.increment();
        _isClicked = true;
      }
      
    });
  }
}