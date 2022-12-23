class FAQ {
  String topic;
  String question;
  String answer;

  FAQ({required this.topic, required this.question, required this.answer});

  FAQ.fromMap(Map<String, dynamic> map)
      : topic = map['topic'] ?? "",
        question = map['question'] ?? "",
        answer = map["answer"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "topic": topic,
      "question": question,
      "answer": answer,
    };
  }
}
