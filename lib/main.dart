import 'package:flutter/material.dart';

// Ponto de entrada do aplicativo Flutter
void main() {
  runApp(const MainApp());
}

// App principal que configura MaterialApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp fornece tema e navegação básica para o app
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //remover o selo DEBUG
      home: const TelaSoma(), // Tela inicial do app
    );
  }
}

//----------TELA SOMA-----------

// Tela que precisa manter estado (valores dos inputs e resultado)
class TelaSoma extends StatefulWidget {
  const TelaSoma({super.key});

  @override
  State<TelaSoma> createState() => _TelaSomaState();
}

// Estado da TelaSoma: é aqui que guardamos os controllers e o resultado
class _TelaSomaState extends State<TelaSoma> {
  // CRIAÇÃO DAS INPUTS
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  // Variável que armazena o resultado
  double resultado = 0;

  // -------- FUNÇÕES --------

  // Função chamada ao pressionar o botão 'Somar'
  void somar() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      resultado = n1 + n2;
    });
  }

  // Subtrair
  void subtrair() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      resultado = n1 - n2;
    });
  }

  // Multiplicar
  void multiplicar() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      resultado = n1 * n2;
    });
  }

  // Dividir
  void dividir() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      if (n2 == 0) {
        resultado = double.nan;
      } else {
        resultado = n1 / n2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Somar Números'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numero1Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o primeiro número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: numero2Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o segundo número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // -------- BOTÕES LADO A LADO --------
            // -------- BOTÕES EM 2 LINHAS --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: somar, child: const Text('Somar')),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: subtrair,
                  child: const Text('Subtrair'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: multiplicar,
                  child: const Text('Multiplicar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: dividir,
                  child: const Text('Dividir'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
