

// this is not widget but it is a blueprint for questions so it will not extendes anything
class QuizQuestion{
  // it stores data and logic

 const QuizQuestion(this.text,this.answers);   // constructor func of class maps to questions and answer
  final String text;
  final List<String> answers;   // old list


List<String> get shuffledAnswer{
  // List is also the class in flutter
  // List offers a couple of utility functions that makes easy to create a list
  final shuffledList=List.of(answers);    // first we copy the original list and then shuffle it
  shuffledList.shuffle();
  return shuffledList;
}
}