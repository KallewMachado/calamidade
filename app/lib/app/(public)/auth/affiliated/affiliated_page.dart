import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedPage extends StatelessWidget {
  const AffiliatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    return Scaffold(
      appBar: AppBar(
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
          Image.asset('assets/pngs/background_details.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Sucesso!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'inter'),
              ),
              Image.asset(
                'assets/pngs/affiliated.png',
                width: MediaQuery.sizeOf(context).width * 0.8,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Você é um cooperado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'inter',
                    color: colors.primary,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Prossiga para concluir seu cadastro',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                    color: colors.black),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Já tenho cadastro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                    color: colors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: colors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CooButton(
                  label: 'Concluir cadastro',
                  onPressed: () {},
                  icon: Icons.arrow_right_alt),
              const Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
