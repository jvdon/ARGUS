import 'dart:async';
import 'dart:convert';

import 'package:ARGUS/models/tipo_servico.dart';
import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/partials/custom_input.dart';
import 'package:ARGUS/partials/custom_text.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:http/http.dart' as http;

class DropoutPage extends StatefulWidget {
  const DropoutPage({super.key});

  @override
  State<DropoutPage> createState() => _DropoutPageState();
}

class _DropoutPageState extends State<DropoutPage> {
  List<TipoServico> selectedServices = [];
  TextEditingController nomeEmpresa = TextEditingController();
  TextEditingController endereco = TextEditingController();

  String info = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 40),
      child: Form(
        child: Column(
          children: [
            CustomText("Cadastre Sua Empresa", fontSize: 24),
            const SizedBox(
              height: 20,
            ),
            CustomInput(label: "Nome da Empresa", controller: nomeEmpresa),
            const SizedBox(height: 20),
            CustomInput(label: "Endereço", controller: endereco),
            const SizedBox(height: 20),
            const CustomText("Selecione o tipo de serviço fornecido",
                fontSize: 20),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: servicos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    TipoServico servico = servicos[index];

                    bool selected = selectedServices.contains(servico);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            selectedServices.remove(servico);
                          } else {
                            selectedServices.add(servico);
                          }
                          selected = !selected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: palette["green3"]!.withAlpha(150),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: (selected)
                              ? palette["green3"]!.withAlpha(60)
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.trash2,
                              color: servico.color,
                              size: 80,
                            ),
                            Text(servico.nome)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            (info.isNotEmpty)
                ? Container(
                    width: 400,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: palette["green1"]!, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      color: palette["green2"],
                    ),
                    child: Center(
                      child: Text(
                        info,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inder(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            (loading)
                ? CircularProgressIndicator(
                    color: palette["green2"]!,
                  )
                : SizedBox(),
            const SizedBox(height: 20),
            CustomButton(
              content: "CADASTRAR",
              onClick: () async {
                setState(() {
                  loading = true;
                  info = "";
                });
                try {
                  Map<String, dynamic> formData = {
                    'nome': nomeEmpresa.text,
                    'location': endereco.text,
                    'servicos': jsonEncode(
                        selectedServices.map((e) => e.toMap()).toList())
                  };

                  http.Response response = await http
                      .post(Uri.parse("$baseUrl/depot/submit"), body: formData);
                  if (response.statusCode == 200) {
                    setState(() {
                      info = "Empresa cadastrada com sucesso\nRedirecionando para a pagina principal em 3 segundos";
                      loading = false;
                    });

                    Timer(Duration(seconds: 3), () {
                      print("Done!");
                      Navigator.of(context).pushReplacementNamed("/empresa");
                    });
                  } else {
                    setState(() {
                      info = "Erro ao cadastrar empresa";
                      loading = false;
                    });
                  }
                } catch (e) {
                  print(e);
                  setState(() {
                    info = "Error: ${e.toString()}";
                    loading = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
