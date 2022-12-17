import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Hesap extends StatefulWidget {
  double money, sale;
  Hesap({required this.money, required this.sale, Key? key}) : super(key: key);

  @override
  State<Hesap> createState() => _HesapState();
}

class _HesapState extends State<Hesap> {
  /*static double get sale => ;
  static double? get money => null;
  double i = 100 - sale;
  double j = i / 100;
  double para = money * j;
    */

  @override
  Widget build(BuildContext context) {
    return const TextField();
  }
}
