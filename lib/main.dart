import 'package:flutter/material.dart';

// MV 패턴으로 코드 작성해보기
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // view는 viewModel 주소 값을 가지고 있어야 한다.
  final CounterViewModel viewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('viewModel 없이 작성'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('간단한 뷰와 모델 예제'),
            Text(
              '${viewModel._count}',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    viewModel.incrementCounter();
                  });
                },
                child: Text('증가'))
          ],
        ),
      ),
    );
  }
}

// viewModel 클래스 만들어 보기
class CounterViewModel {

  int _count = 0;
  int get counter => _count;

  void incrementCounter() {
    _count++;
  }
}