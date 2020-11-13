import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:football/domain/model/failure.dart';
import 'package:football/model/news.dart';

enum ViewState { initial, loading, loaded }

class BaseViewModel<T>  extends ChangeNotifier {

  ViewState _state = ViewState.initial;

  ViewState get
  state => _state;
  void setViewState(ViewState state, {Failure failure}) {
    _state = state;
    notifyListeners();
  }

  T _result;
  T get result => _result;
  void setResult(T result) {
    _result = result;
    notifyListeners();
  }

  Failure _errorData;
  Failure get failure => _errorData;
  void setError(Failure errorData) {
    _errorData = errorData;
  }

}