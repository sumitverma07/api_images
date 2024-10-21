import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

final apiKey = 'b3a8efc234mshfa17c179c5a4f0ap1d9febjsned7559305a83';
final baseUrl =
    'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c548593/i.jpg';

class ImageCubit extends Cubit<ApiState> {
  ImageCubit() : super(ApiInitialState());
  Future<Uint8List> getApi() async {
    final res = await http.get(Uri.parse(baseUrl), headers: {
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com',
      'x-rapidapi-key': apiKey,
    });
    if (res.statusCode == 200) {
      emit(ApiLoadedState());
      return res.bodyBytes;
    } else {
      throw Exception('unable to fetch data');
    }
  }
}

class ApiState {}

class ApiInitialState extends ApiState {}

class ApiLoadingState extends ApiState {}

class ApiLoadedState extends ApiState {}
