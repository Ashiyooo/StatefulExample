import "package:flutter/material.dart";

class buttonSection extends StatelessWidget{
  const buttonSection({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.deepOrange;
    
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatefulButton(),
        ButtonWithText(color: color, icon: Icons.near_me, label: 'Go'),
        ButtonWithText(color: color, icon: Icons.pending_outlined, label: 'More'),
      ],
    );
    
  }
}

class StatefulButton extends StatefulWidget{

  const StatefulButton({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StatefulButton();
}

class _StatefulButton extends State<StatefulButton>{
  bool _active = false;
  Color _color = Colors.deepOrange;
  final String setAlarm = 'Alarm Set';
  final String unsetAlarm = 'Alarm turned off';
  
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: _active? 
                    Text(unsetAlarm):
                    Text(setAlarm)
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    _active = !_active;
                  });
                }, 
              icon: (_active)?  
                ButtonWithText(color: _color, icon: Icons.alarm_off_rounded, label: 'Turn off alarm'):
                ButtonWithText(color: _color, icon: Icons.alarm_add, label: 'Set alarm'),
            );       
  }
  //void _handleTap() => setState(() { _active = !_active;});
}
class ButtonWithText extends StatelessWidget{
  final Color color;
  final IconData icon;
  final String label;


  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}