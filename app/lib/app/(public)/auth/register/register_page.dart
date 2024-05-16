import 'package:coopartilhar/app/(public)/auth/register/non_editable_register_item.dart';
import 'package:coopartilhar/app/(public)/auth/register/register_item_field.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// TODO: mover para o controller

  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _repeatPasswordController =
      TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  /// TODO: mover para o controller quando ele for criado
  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Concluir cadastro',
          style: textTheme.displayLarge?.copyWith(color: colors.textColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              /// TODO: receber valores do controller quando ele for criado

              const NonEditableRegisterItem(
                title: 'Nome completo',
                value: 'John Doe',
              ),
              const SizedBox(height: 30),

              /// TODO: receber valores do controller quando ele for criado

              const NonEditableRegisterItem(
                title: 'Informe o seu CPF/CNPJ',
                value: '123.456.789-10',
              ),
              const SizedBox(height: 30),
              RegisterItemField(
                title: 'E-mail',
                controller: _emailController,
                hint: 'Insira o e-mail',

                /// TODO: mover para controller quando ele for criado
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'O e-mail não pode estar vazio';
                  } else if (!value.contains('@')) {
                    return 'E-mail  inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RegisterItemField(
                      title: 'Senha',
                      controller: _passwordController,
                      hint: 'Insira a senha',

                      /// TODO: mover para controller quando ele for criado
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode estar vazia';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: RegisterItemField(
                      title: 'Senha',
                      hint: 'Repetir a senha',
                      controller: _repeatPasswordController,

                      /// TODO: mover para o controller quando ele for criado
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode estar vazia';
                        } else if (_passwordController.text.isNotEmpty &&
                            value != _passwordController.text) {
                          return 'As senhas devem ser iguais';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CooButton.primary(
                label: 'Entrar',
                onPressed: _submit,
                size: const Size(double.infinity, 56),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
