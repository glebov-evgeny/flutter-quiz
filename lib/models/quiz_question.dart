class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledList =
        List.of(answers); // List.of - создает копию без мутации
    shuffledList.shuffle(); // shuffle копии без изменения оригинала
    return shuffledList;
  }
}
