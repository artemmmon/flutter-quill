import 'package:flutter/material.dart';
import 'package:flutter_quill/src/config/toolbar_style.dart';
import 'package:provider/src/provider.dart';

import '../../../flutter_quill.dart';
import 'quill_icon_button.dart';

class HistoryButton extends StatefulWidget {
  const HistoryButton({
    required this.icon,
    required this.controller,
    required this.undo,
    this.iconSize = kDefaultIconSize,
    this.iconTheme,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;
  final bool undo;
  final QuillController controller;
  final QuillIconTheme? iconTheme;

  @override
  _HistoryButtonState createState() => _HistoryButtonState();
}

class _HistoryButtonState extends State<HistoryButton> {
  Color? _iconColor;

  @override
  Widget build(BuildContext context) {
    final style = context.watch<QuillToolbarStyle>();
    _setIconColor(style);

    widget.controller.changes.listen((event) async {
      _setIconColor(style);
    });
    return QuillIconButton(
      highlightElevation: 0,
      hoverElevation: 0,
      size: widget.iconSize * 1.77,
      icon: Icon(widget.icon, size: widget.iconSize, color: _iconColor),
      fillColor: style.colorToolbar,
      onPressed: () => _changeHistory(style),
    );
  }

  void _setIconColor(QuillToolbarStyle style) {
    if (!mounted) return;

    if (widget.undo) {
      setState(() {
        _iconColor =
            widget.controller.hasUndo ? style.buttonStyle.colorIconEnabled : style.buttonStyle.colorIconDisabled;
      });
    } else {
      setState(() {
        _iconColor =
            widget.controller.hasRedo ? style.buttonStyle.colorIconEnabled : style.buttonStyle.colorIconDisabled;
      });
    }
  }

  void _changeHistory(QuillToolbarStyle style) {
    if (widget.undo) {
      if (widget.controller.hasUndo) {
        widget.controller.undo();
      }
    } else {
      if (widget.controller.hasRedo) {
        widget.controller.redo();
      }
    }

    _setIconColor(style);
  }
}
