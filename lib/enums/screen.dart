enum Screen {
  start(name: 'start-screen'),
  questions(name: 'questions-screen'),
  result(name: 'result-screen');

  const Screen({
      required this.name,
  });

  final String name;
}