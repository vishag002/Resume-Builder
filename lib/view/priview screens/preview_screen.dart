import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  Color _textColor = Colors.black;
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
  double _fontSize = 16;
  String _fontFamily = 'Arial';
  TextAlign _textAlign = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume Preview"),
        actions: [
          IconButton(
            onPressed: () {
              // Implement download functionality
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              child: CustomPaint(
                painter: ResumePainter(
                  textColor: _textColor,
                  textStyle: _textStyle,
                  fontSize: _fontSize,
                  fontFamily: _fontFamily,
                  textAlign: _textAlign,
                ),
                size: Size.infinite,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Text Color"),
                Row(
                  children: [
                    _colorOption(Colors.black),
                    _colorOption(Colors.red),
                    _colorOption(Colors.blue),
                    _colorOption(Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Text("Font Size"),
                Slider(
                  value: _fontSize,
                  min: 8,
                  max: 48,
                  onChanged: (value) {
                    setState(() {
                      _fontSize = value;
                      _textStyle = _textStyle.copyWith(fontSize: _fontSize);
                    });
                  },
                ),
                SizedBox(height: 10),
                Text("Font Family"),
                DropdownButton<String>(
                  value: _fontFamily,
                  items: <String>['Arial', 'Times New Roman', 'Courier New']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fontFamily = newValue!;
                      _textStyle = _textStyle.copyWith(fontFamily: _fontFamily);
                    });
                  },
                ),
                SizedBox(height: 10),
                Text("Text Alignment"),
                Row(
                  children: [
                    _alignmentOption(TextAlign.left, "Left"),
                    _alignmentOption(TextAlign.center, "Center"),
                    _alignmentOption(TextAlign.right, "Right"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _textColor = color;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        width: 24,
        height: 24,
        color: color,
      ),
    );
  }

  Widget _alignmentOption(TextAlign alignment, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _textAlign = alignment;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(text),
      ),
    );
  }
}

class ResumePainter extends CustomPainter {
  final Color textColor;
  final TextStyle textStyle;
  final double fontSize;
  final String fontFamily;
  final TextAlign textAlign;

  ResumePainter({
    required this.textColor,
    required this.textStyle,
    required this.fontSize,
    required this.fontFamily,
    required this.textAlign,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = textColor
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'John Doe\nSoftware Developer\n\nExperience\nEducation\nSkills',
        style: textStyle.copyWith(fontSize: fontSize, fontFamily: fontFamily),
      ),
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    textPainter.paint(canvas, Offset(20, 20));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
