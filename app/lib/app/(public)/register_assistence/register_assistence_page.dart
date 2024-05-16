import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterAssistencePage extends StatefulWidget {
  const RegisterAssistencePage({super.key});

  @override
  State<RegisterAssistencePage> createState() => _RegisterAssistencePageState();
}

class _RegisterAssistencePageState extends State<RegisterAssistencePage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _cpfOrCnpjController;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();

    _cpfOrCnpjController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    _cpfOrCnpjController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/pngs/background_details.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Image(
                            image: CooImages.cooBrand,
                            width: 150,
                            height: 124,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informar Assistido',
                            style: textTheme.displayLarge?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'CPF/CNPJ',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _cpfOrCnpjController,
                            decoration: const InputDecoration(
                              hintText: 'Informe seu CPF/CNPJ',
                            ),
                            validator: _validatorEmpty('CPF/CNPJ não pode esta vazio'),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Nome Completo',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu nome completo',
                            ),
                            validator: _validatorEmpty('Nome não pode esta vazio'),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'E-mail',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu e-mail',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail não pode esta vazio';
                              }

                              if (!value.contains('@') && !value.contains('.')) {
                                return 'Esse campo precisa ser um e-mail valido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Telefone',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu número de telefone',
                            ),
                            validator: _validatorEmpty('Telefone não pode esta vazio'),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Localização (geo/endereço)',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _locationController,
                                  decoration: const InputDecoration(
                                    hintText: 'Insira sua localização',
                                  ),
                                  validator: (String? value) => (value == null || value.isEmpty) ? 'Localização não pode esta vazio' : null,
                                ),
                              ),
                              SizedBox(
                                height: 52,
                                child: CooButton.primary(
                                  icon: Icons.place,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 63),
                          SizedBox(
                            height: 56,
                            child: CooButton.primary(
                              onPressed: _register,
                              label: 'Próximo',
                            ),
                          ),
                          const SizedBox(height: 48),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? Function(String?)? _validatorEmpty(String message) {
    return (value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      return null;
    };
  }
}
