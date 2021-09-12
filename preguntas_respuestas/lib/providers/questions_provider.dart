import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:preguntas_respuestas/models/question_response.dart';

class QuestionProvider extends ChangeNotifier{

  List<Question> questionCustomer = [];

  String _baseUrl = 'questions-customers.herokuapp.com'; 

  QuestionProvider() {
    print('Provider inicializando');

    this.getQuestionCustomer();
  }

  getQuestionCustomer() async {
    final url = Uri.https(_baseUrl, 'api/questions');

    final response = await http.get(url);
    final questionResponse = QuestionsResponse.fromJson(response.body);

    questionCustomer = questionResponse.questions;

    notifyListeners();

  }


  postQuestionCustomer(titulo, descripcion) async {

    Map<String, dynamic> data = {
      'titleQuestion': titulo,
      'description': descripcion
    };

    final url = Uri.https(_baseUrl, 'api/questions');

    final response = await http.post(url, body: data);

    Question.fromJson(response.body);

    notifyListeners();

  }

}