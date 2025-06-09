# Projeto Flutter + Firebase + JSON Serializable

Este projeto demonstra o uso de `json_serializable` em Flutter com integração ao Firebase.

## Recursos
- Firebase Core
- Serialização JSON automática
- Estrutura de modelos aninhados

## Como executar

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutterfire configure
flutter run
```

## Estrutura de modelos

- `User`
- `Address`
- `UserAddress` (modelo com composição)

## Autor
Atividade desenvolvida conforme solicitado no curso. Colaborador: `renato-montanher`.
