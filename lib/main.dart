import 'package:flutter/material.dart';

void main() {
  runApp(AppCalc());
}

class AppCalc extends StatefulWidget {
  const AppCalc({super.key});

  @override
  State<AppCalc> createState() => _AppCalcState();
}

class _AppCalcState extends State<AppCalc> {
  String numero = '';
  double primeiroNumero = 0.0;
  String operacao = '';
  double resultado = 0.0;
  void calcular(String tecla) {
    switch (tecla) {
      case '9':
      case '8':
      case '7':
      case '6':
      case '5':
      case '4':
      case '3':
      case '2':
      case '1':
      case '0':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
            //double numeroDouble = double.parse(numero);
            //numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;
      case 'AC':
        setState(() {
          numero = '';
        });
        break;
      case '+':
        operacao = tecla;
        primeiroNumero = double.parse(numero.replaceAll(',', '.'));
        numero = '0';
        break;
      case '-':
        operacao = tecla;
        primeiroNumero = double.parse(numero.replaceAll(',', '.'));
        numero = '0';
        break;
      case 'x':
        operacao = tecla;
        primeiroNumero = double.parse(numero.replaceAll(',', '.'));
        numero = '0';
        break;
      case '/':
        operacao = tecla;
        primeiroNumero = double.parse(numero.replaceAll(',', '.'));
        numero = '0';
        break;
      case '<x':
        if (numero.length > 0) {
          setState(() {
            numero = numero.substring(0, numero.length - 1);
          });
        }

        break;
      case '=':
        if (operacao == '+') {
          setState(() {
            resultado = primeiroNumero + double.parse(numero);
          });
        } else if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        } else if (operacao == 'x') {
          resultado = primeiroNumero * double.parse(numero);
        } else if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            print('zero');
            return;
          }
          resultado = primeiroNumero / double.parse(numero);
        }
        setState(() {
          numero = resultado.toString();
          numero = numero.replaceAll('.', ',');
        });

        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Image.asset('assets/img/icons8-settings-36(-hdpi).png'),
            Text('Calculadora'),
          ]),
          backgroundColor: Color.fromARGB(255, 37, 38, 66),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                '$numero',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                '${resultado.toString().replaceAll('.', ',')}',
                style: TextStyle(color: Colors.white, fontSize: 40),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular('AC'),
                  child: Text('AC'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(232, 108, 30, 233),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Color.fromARGB(255, 205, 83, 249)),
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.pink),
                ),
                ElevatedButton(
                  onPressed: () => calcular('/'),
                  child: Text('/'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(232, 108, 30, 233),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),  
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular('7'),
                  child: Text('7'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('8'),
                  child: Text('8'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('9'),
                  child: Text('9'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('X'),
                  child: Text('X'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(232, 108, 30, 233),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular('4'),
                  child: Text('4'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('5'),
                  child: Text('5'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('6'),
                  child: Text('6'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('-'),
                  child: Text('-'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(232, 108, 30, 233),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular('1'),
                  child: Text('1'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('2'),
                  child: Text('2'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('3'),
                  child: Text('3'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular('+'),
                  child: Text('+'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(232, 108, 30, 233),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular('0'),
                  child: Text('0'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calcular(','),
                  child: Text(','),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 83, 249),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => calcular('<x'),
                    child: Image.asset(
                      'assets/img/7122404_backspace_icon.png',
                      height: 40,
                    )),
                ElevatedButton(
                  onPressed: () => calcular('='),
                  child: Text('='),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(232, 108, 30, 233),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      )),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 37, 38, 66),
      ),
    );
  }
}
