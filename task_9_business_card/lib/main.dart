import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyBusinessCard(),
    );
  }
}

class MyBusinessCard extends StatelessWidget {
  MyBusinessCard({super.key});

  final Widget svgIcon = SvgPicture.asset('images/earth.svg',
      width: 20,
      colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Моя Визитка'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 61,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/ava.jpeg'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('Лагун Станислав ',
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextWidget(
                  text1: 'О себе:',
                  text2:
                      'Привет! Я, страстный разработчик и творческий энтузиаст. '
                      'Меня вдохновляет возможность создавать инновационные решения,'
                      ' которые делают жизнь лучше.',
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextWidget(
                  text1: 'Увлечения:',
                  text2: 'Мое сердце бьется в такт коду, но вне мира разработки я также '
                      'нахожу удовольствия в путешествиях и ковке металла. '
                      'Это мои источники вдохновения, которые помогают мне поддерживать'
                      ' баланс в жизни.',
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextWidget(
                  text1: 'Опыт в разработке приложений:',
                  text2: 'Год опыта в создании приложений, моя страсть к кодированию'
                      ' привела меня к разнообразным проектам. ',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    svgIcon,
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Давайте сделаем будущее вместе!',
                        style: GoogleFonts.glory(fontSize: 15)),
                    const SizedBox(
                      width: 5,
                    ),
                    svgIcon,
                  ],
                ),
              ],
            ),
          )),
    );
  }
}



class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const TextWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(text1, style: GoogleFonts.roboto(fontSize: 20))),
        Text(
          text2,
          style: GoogleFonts.handjet(fontSize: 20),
        ),
      ],
    );
  }
}
