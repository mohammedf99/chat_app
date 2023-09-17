import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 63, 17, 177),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: colorScheme,
);
