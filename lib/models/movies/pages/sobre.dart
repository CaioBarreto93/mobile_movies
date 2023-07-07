import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'SOBRE NÓS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: const Column(
        children: [
           Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Nós somos uma equipe de desenvolvimento que elaborou esse aplicativo de filmes que tem como objetivo proporcionar uma plataforma onde é possível explorar e desfrutar de uma ampla variedade de filmes e séries. Nós nos esforçamos para oferecer uma experiência cinematográfica envolvente e cativante.',
                  ),
                  TextSpan(
                    text:
                        'A equipe por trás do aplicativo é composta por Caio Barreto, Luismar Rastelli, Juarez Santana e Victor Santos. Cada membro traz habilidades únicas e paixão pelo que fazemos. Estamos comprometidos em oferecer um produto de qualidade e uma experiência excepcional para você.',
                  ),
                  TextSpan(
                    text:
                        'Agradecemos por fazer parte da nossa jornada. Esperamos que aproveite o aplicativo tanto quanto nós aproveitamos criá-lo.',
                  )
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
