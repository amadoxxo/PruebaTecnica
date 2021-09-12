import 'dart:convert';

class QuestionsResponse {
    QuestionsResponse({
        this.ok,
        this.questions,
    });

    bool ok;
    List<Question> questions;

    factory QuestionsResponse.fromJson(String str) => QuestionsResponse.fromMap(json.decode(str));

    factory QuestionsResponse.fromMap(Map<String, dynamic> json) => QuestionsResponse(
        ok: json["ok"],
        questions: List<Question>.from(json["questions"].map((x) => Question.fromMap(x))),
    );

}

class Question {
    Question({
        this.id,
        this.titleQuestion,
        this.description,
        this.calificationAnswer,
    });

    String id;
    String titleQuestion;
    String description;
    int calificationAnswer;

    factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

    factory Question.fromMap(Map<String, dynamic> json) => Question(
        id: json["_id"],
        titleQuestion: json["titleQuestion"],
        description: json["description"],
        calificationAnswer: json["calificationAnswer"],
    );
}
