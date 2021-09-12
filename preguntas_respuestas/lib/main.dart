import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:preguntas_respuestas/pages/cards_preguntas.dart';
import 'package:preguntas_respuestas/providers/questions_provider.dart';
import 'pages/preguntas_page.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionProvider(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pregunta y respuestas App',
      initialRoute: 'home',
      routes: {
        'home': (_) => PreguntasPage(),
        'cards': (_) => CardsPreguntas()
      },
      theme: ThemeData.light().copyWith(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.blue
          )
        )
      ),
    );
  }
}