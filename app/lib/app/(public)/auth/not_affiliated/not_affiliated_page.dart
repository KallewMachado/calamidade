import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NotAfilliatedPage extends StatefulWidget {
  const NotAfilliatedPage({super.key});

  @override
  State<NotAfilliatedPage> createState() => _NotAfilliatedPageState();
}

class _NotAfilliatedPageState extends State<NotAfilliatedPage> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    return Scaffold(
      appBar: AppBar(
        // TODO: padronizar ícone da appbar através do app
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'assets/pngs/not_affiliated.png',
                width: MediaQuery.sizeOf(context).width * 0.8,
              ),
              const SizedBox(height: 32),
              Text(
                'Você não é\num Cooperado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Não podemos te ajudar no momento!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
