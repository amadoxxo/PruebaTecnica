import 'package:flutter/material.dart';
import 'package:preguntas_respuestas/models/question_response.dart';

class CardsPreguntas extends StatefulWidget {
  @override
  _CardsPreguntasState createState() => _CardsPreguntasState();
}

class _CardsPreguntasState extends State<CardsPreguntas> {
  @override
  Widget build(BuildContext context) {

  final List<Question> questions = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemBuilder: ( _ , index) {

          final question = questions[index];

          return CardsUsuario(question: question,);
        },
      ),
    );
  }
}

class CardsUsuario extends StatefulWidget {
  
  final Question question;

  const CardsUsuario({
    Key key, 
    @required this.question
  }) : super(key: key);

  @override
  _CardsUsuarioState createState() => _CardsUsuarioState();
}

class _CardsUsuarioState extends State<CardsUsuario> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text(widget.question.titleQuestion, 
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(widget.question.description),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: Icon(Icons.edit),
                onPressed: () {},
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                child: Icon(Icons.delete),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}