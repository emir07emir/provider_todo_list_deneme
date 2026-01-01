import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier{

  List todolist = [];
  var tfcontrol = TextEditingController();



  String? ekle(var eklenen){
    todolist.add(eklenen);
    tfcontrol.text="";
    notifyListeners();
  }

  void sil(deger){
    todolist.remove(deger);
    notifyListeners();
  }

  void guncelle(int index, String yeniDeger){
    if(yeniDeger.isEmpty) return;
    todolist[index] = yeniDeger;
    tfcontrol.clear();
    notifyListeners();
  }






}