import 'package:app_calculadora/classes/pessoa.dart';
import 'package:app_calculadora/utils/utils.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Genero { masculino, feminino }

class _MyHomePageState extends State<MyHomePage> {
  Pessoa pessoa = Pessoa(0, 0, 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Genero generoView = Genero.masculino;
  bool resultado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC ",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(13, 13, 13, 0.965),
      ),
      body: Container(
        color: const Color.fromRGBO(13, 13, 13, 0.965),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton(
                  showSelectedIcon: false,
                  style: SegmentedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    selectedForegroundColor: Colors.white,
                    selectedBackgroundColor:
                        const Color.fromRGBO(255, 0, 0, 10),
                  ),
                  segments: const <ButtonSegment<Genero>>[
                    ButtonSegment<Genero>(
                        value: Genero.masculino,
                        label: Text(
                          "Masculino",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                    ButtonSegment<Genero>(
                      value: Genero.feminino,
                      label: Text(
                        "Feminino",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                  selected: <Genero>{generoView},
                  onSelectionChanged: (Set<Genero> newGenero) {
                    setState(() {
                      generoView = newGenero.first;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Card(
                  color: const Color.fromRGBO(44, 44, 44, 0.996),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        const Utils(
                          texto: "Altura",
                        ),
                        Text(
                          "${pessoa.getAltura().toStringAsFixed(2)} m",
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Slider(
                            thumbColor: const Color.fromRGBO(255, 0, 0, 10),
                            activeColor: Colors.white,
                            min: 0,
                            max: 3,
                            value: pessoa.getAltura(),
                            onChanged: (double value) {
                              setState(() {
                                pessoa.setAltura(value);
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Card(
                        color: const Color.fromRGBO(44, 44, 44, 0.996),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              const Utils(
                                texto: "Peso",
                              ),
                              Text(
                                "${pessoa.getPeso().toStringAsFixed(1)} Kg",
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Slider(
                                  thumbColor:
                                      const Color.fromRGBO(255, 0, 0, 10),
                                  activeColor: Colors.white,
                                  min: 0,
                                  max: 150,
                                  value: pessoa.getPeso(),
                                  onChanged: (double value) {
                                    setState(() {
                                      pessoa.setPeso(value);
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: const Color.fromRGBO(44, 44, 44, 0.996),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              const Utils(
                                texto: "Idade",
                              ),
                              Text(
                                "${pessoa.getIdade().round()} anos",
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    const Color.fromRGBO(
                                                        0, 0, 0, 0.922))),
                                        onPressed: () {
                                          if (pessoa.getIdade() <= 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Idade não pode ser menor que 0")));
                                            return;
                                          }
                                          setState(() {
                                            pessoa.diminuirIdade();
                                          });
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    const Color.fromRGBO(
                                                        0, 0, 0, 19))),
                                        onPressed: () {
                                          setState(() {
                                            pessoa.aumentarIdade();
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              )
                              /*Slider(
                                  thumbColor: Colors.red,
                                  activeColor: Colors.white,
                                  min: 0,
                                  max: 100,
                                  value: idadeEscolhida,
                                  onChanged: (double value) {
                                    setState(() {
                                      idadeEscolhida = value;
                                    });
                                  })*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(255, 0, 0, 10))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Impede que o diálogo seja fechado ao clicar fora
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(255, 0, 0, 10),
                            ),
                          );
                        },
                      );
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (BuildContext bc) {
                              return AlertDialog(
                                elevation: 18,
                                shadowColor:
                                    const Color.fromRGBO(255, 0, 0, 10),
                                backgroundColor:
                                    const Color.fromRGBO(44, 44, 44, 0.996),
                                title: const Text(
                                  "Resultado",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                content: SizedBox(
                                  height: 220,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Idade: ${pessoa.getIdade().toStringAsFixed(0)} anos ",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Peso: ${pessoa.getPeso().toStringAsFixed(1)} Kg ",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Altura: ${pessoa.getAltura().toStringAsFixed(2)} m",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Seu IMC é de: ${pessoa.calcularIMC(pessoa.getAltura(), pessoa.getPeso()).toStringAsFixed(2)}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Seu IMC indica que ${pessoa.frase}",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      });
                    },
                    child: const Utils(texto: "Calcular IMC")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
