import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final String name;
  final Widget Function(dynamic)? pageBuilder;

  const RouteItem({required this.path, required this.name, required this.pageBuilder});

  @override
  String toString() => name;

  Widget page(dynamic argument) => pageBuilder!(argument);
}
