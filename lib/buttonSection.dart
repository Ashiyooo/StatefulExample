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
        StatefulButton(icon1: Icons.alarm_on, icon2: Icons.alarm_off, label1: 'Set Alarm', label2: 'Unset Alarm'),
        ButtonWithText(color: color, icon: Icons.near_me, label: 'Go'),
        StatefulButton(icon1: Icons.pending_outlined, icon2: Icons.pending_rounded, label1: 'More', label2: 'More')
      ],
    );
    
  }
}

class StatefulButton extends StatefulWidget{
  final IconData icon1;
  final IconData icon2;
  final String label1;
  final String label2;

  const StatefulButton({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.label1,
    required this.label2,
  });

  @override
  State<StatefulWidget> createState() => _StatefulButton();
}

class _StatefulButton extends State<StatefulButton>{
  bool _active = true;
  final Color _color = Colors.deepOrange;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: _handleTap,
              icon: (_active)?  
                ButtonWithText(color: _color, icon: widget.icon1, label: widget.label1):
                ButtonWithText(color: _color, icon: widget.icon2, label: widget.label2),
            );       
  }
  void _handleTap() => setState(() { _active = !_active;});
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