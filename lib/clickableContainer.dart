import "package:flutter/material.dart";

class ClickableContainer extends StatefulWidget{
  const ClickableContainer({super.key});
  
  @override
  State<StatefulWidget> createState() => _ContainerState();
}

class _ContainerState extends State<ClickableContainer>{
  double _size = 100;
  final bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
        ChangeableBox(
          active: _active,
          onClicked: _changeColor,
          width: _size,
          height: _size,
        ),
        Slider(
          value: _size, 
          max: 300.0,
          min: 50.0,
          onChanged: (value){ setState(() {
            _size = value;
          });},
        )
      ]    
    );
  }

  void _changeColor(bool newValue) {
    setState(() => newValue);
  }
}

class ChangeableBox extends StatelessWidget{
  final active;
  final ValueChanged<bool> onClicked;
  final double width, height;

  const ChangeableBox({
    super.key,
    this.active = false,
    required this.onClicked,
    required this.width,
    required this.height,
  });

  void _handleTap(){
    onClicked(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: width,
        height: height,
        color: active? Colors.deepOrange: Colors.amber,
      ),
    );
  }
}