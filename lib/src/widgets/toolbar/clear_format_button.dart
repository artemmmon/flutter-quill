import 'package:flutter/material.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:provider/src/provider.dart';

import '../../../flutter_quill.dart';
import 'quill_icon_button.dart';

class ClearFormatButton extends StatefulWidget {
  const ClearFormatButton({
    required this.icon,
    required this.controller,
    this.iconSize = kDefaultIconSize,
    this.iconTheme,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;

  final QuillController controller;

  final QuillIconTheme? iconTheme;

  @override
  _ClearFormatButtonState createState() => _ClearFormatButtonState();
}

class _ClearFormatButtonState extends State<ClearFormatButton> {
  @override
  Widget build(BuildContext context) {
    final style = context.watch<QuillToolbarStyle>();
    final iconColor = style.buttonStyle.colorIconEnabled;
    final fillColor = style.colorToolbar;
    return QuillIconButton(
        highlightElevation: 0,
        hoverElevation: 0,
        size: widget.iconSize * kIconButtonFactor,
        icon: Icon(widget.icon, size: widget.iconSize, color: iconColor),
        fillColor: fillColor,
        onPressed: () {
          final attrs = <Attribute>{};
          for (final style in widget.controller.getAllSelectionStyles()) {
            for (final attr in style.attributes.values) {
              attrs.add(attr);
            }
          }
          for (final attr in attrs) {
            widget.controller.formatSelection(Attribute.clone(attr, null));
          }
        });
  }
}
