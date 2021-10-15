import 'package:flutter/material.dart';

class QuillToolbarStyle {
  const QuillToolbarStyle({
    required this.colorToolbar,
    required this.buttonStyle,
  });

  /* =-=-=-=-=-= [General] =-=-=-=-=-= */
  final Color colorToolbar;

  /* =-=-=-=-=-= [Button] =-=-=-=-=-= */
  final QuillToolbarButtonStyle buttonStyle;

}

class QuillToolbarButtonStyle {
  const QuillToolbarButtonStyle({
    required this.colorIconEnabled,
    required this.colorIconDisabled,
    required this.colorIconSelected,
    required this.colorBackgroundSelected,
  });

  final Color colorIconEnabled;
  final Color colorIconDisabled;
  final Color colorIconSelected;
  final Color colorBackgroundSelected;
}
