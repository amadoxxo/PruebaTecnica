import 'package:flutter/material.dart';
import 'package:preguntas_respuestas/models/question_response.dart';
import 'package:preguntas_respuestas/pages/cards_preguntas.dart';
import 'package:preguntas_respuestas/providers/questions_provider.dart';
import 'package:provider/provider.dart';

class PreguntasPage extends StatefulWidget {

  @override
  _PreguntasPageState createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {
  final TextEditingController tituloController = new TextEditingController();

  final TextEditingController descripcionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

  final questionProvider = Provider.of<QuestionProvider>(context);

  final List<Question> questions = questionProvider.questionCustomer;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.messenger_sharp),
            onPressed: () => Navigator.pushNamed(context, 'cards', arguments: questions)
          )
        ],
      ),
      body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Text('Preguntas',
                              style: TextStyle( fontSize: 40,
                                                fontWeight: FontWeight.bold
                                              ),
                    ),

                SizedBox(height: 12,),

                Text('Usted como usuario tiene derecho a hacer una pregunta, queja o reclamo acerca de nuestros servicios y productos de nuestra aplicación.\nBuscamos su opinión para el funcionamiento de hacer más optima nuestra aplicación para ustedes como clientes',
                      style: TextStyle(
                        fontWeight: FontWeight.w300
                      ),
                      textAlign: TextAlign.justify,
                    ),

                  SizedBox(height: 15,),

                  TituloPregunta(titulo: tituloController,),

                  SizedBox(height: 30,),

                  DescripcionPregunta(descripcion: descripcionController,),

                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      child: Text('Enviar'),
                      style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                      onPressed: () {
                        setState(() {
                          questionProvider.postQuestionCustomer(tituloController.text, descripcionController.text);                   
                        });
                      }
                    ),
                  )

              ],
            ),
          ),

    );
  }
}

class TituloPregunta extends StatefulWidget {

  final TextEditingController titulo;

  const TituloPregunta({
    Key key,
    @required this.titulo
  }) : super(key: key); 

  @override
  _TituloPreguntaState createState() => _TituloPreguntaState();
}

class _TituloPreguntaState extends State<TituloPregunta> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.widget.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Pregunta',
        hintText: 'Escribe el titulo de tu Pregunta',
        icon: Icon(Icons.question_answer_outlined),
      ),
    );
  }
}


class DescripcionPregunta extends StatefulWidget {

  final TextEditingController descripcion;

  const DescripcionPregunta({
    Key key, 
    @required this.descripcion
  }) : super(key: key);

  @override
  _DescripcionPreguntaState createState() => _DescripcionPreguntaState();
}

class _DescripcionPreguntaState extends State<DescripcionPregunta> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.widget.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        // labelText: 'Descripción',
        hintText: 'Escribe la descripción de tu pregunta',
        icon: Icon(Icons.my_library_books_outlined)
      ),
      maxLines: 10,
    );
  }
}