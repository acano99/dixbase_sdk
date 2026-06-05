# Dixbase SDK para Dart/Flutter

[![Dart SDK Version](https://img.shields.io/badge/sdk-3.0.0%2B-blue)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/badge/pub-v1.0.0-orange)](https://pub.dev)

SDK no oficial para la pasarela de pagos **Dixbase**. Permite integrar pagos con criptomonedas de forma sencilla y rápida en tus aplicaciones Dart o Flutter.

> Basado en la documentación oficial de Dixbase: [app.dixbase.com/docs](https://app.dixbase.com/docs)

---

## ✨ Características

- ✅ **Facturación:** Crea facturas de pago en segundos.
- 🔍 **Consultas:** Obtén detalles de una factura específica o el historial completo.
- 🪙 **Mercado:** Lista criptomonedas disponibles y sus tasas de cambio.
- 🏢 **Perfil:** Accede a la información de tu negocio y configuración de webhooks.
- 🚀 **Tipado Fuerte:** Modelos de datos claros para una mejor experiencia de desarrollo.

## 📦 Instalación

### 1. Desde GitHub (Recomendado para versiones de desarrollo)

Agrega esto a tu `pubspec.yaml`:

```yaml
dependencies:
  dixbase_sdk:
    git:
      url: https://github.com/TU_USUARIO/dixbase_sdk.git
      ref: main # O una etiqueta específica como v1.0.0

Luego ejecuta:

dart pub get
# o
flutter pub get

🚀 Uso básico

Es muy sencillo empezar a cobrar con criptomonedas:

import 'package:dixbase_sdk/dixbase.dart';

void main() async {
  // 1. Inicializa el cliente con tu API Key
  final client = DixbaseClient(apiKey: 'tu_api_key_aqui');

  try {
    // 2. Crear una factura de 10 USDT
    final invoice = await client.createInvoice(
      amount: 10.0,
      currency: 'USDT',
      clientEmail: 'cliente@example.com',
    );

    print('✅ Factura creada con éxito');
    print('🔗 URL de pago: ${invoice.url}');
    print('💰 Dirección: ${invoice.address}');

    // 3. Consultar monedas soportadas y su precio
    final currencies = await client.listCurrencies();
    for (var crypto in currencies) {
      print('${crypto.ticker}: \$${crypto.value}');
    }

  } catch (e) {
    print('❌ Error: $e');
  } finally {
    client.close();
  }
}

📚 Referencia de Métodos

| Método             | Descripción                       | Retorno                         |
| ------------------ | --------------------------------- | ------------------------------- |
| `createInvoice()`  | Crea una nueva orden de pago.     | `Future<DixbaseInvoice>`        |
| `listInvoices()`   | Obtiene el historial de facturas. | `Future<List<DixbaseInvoice>>`  |
| `getInvoice(id)`   | Detalles de una factura por ID.   | `Future<DixbaseInvoice>`        |
| `listCurrencies()` | Criptos disponibles y tasas.      | `Future<List<DixbaseCurrency>>` |
| `getBusiness()`    | Información del comercio.         | `Future<DixbaseBusiness>`       |

Parámetros de createInvoice

  - amount (double): El monto total.
  - currency (String): El ticker de la moneda (ej. BTC, USDT).
  - clientEmail (String?): Email opcional para enviar el recibo.
  - idempotencyKey (String?): Clave única para evitar cobros duplicados.

🛠 Manejo de Errores

El SDK lanzará excepciones descriptivas en caso de fallos de red o errores de la
API (como API Key inválida o fondos insuficientes). Se recomienda usar bloques
try-catch.

🧪 Pruebas

Para asegurar que todo funcione correctamente, ejecuta:

dart test

🤝 Contribuciones

¡Las contribuciones son lo que hacen a la comunidad open source un lugar
increíble!

1.  Haz un Fork del proyecto.
2.  Crea tu Branch de característica (git checkout -b feature/MejorasSDK).
3.  Haz Commit de tus cambios (git commit -m 'Add some feature').
4.  Haz Push a la rama (git push origin feature/MejorasSDK).
5.  Abre un Pull Request.

📄 Licencia

Distribuido bajo la Licencia MIT. Consulta LICENSE para más información.

⚠️ Aviso Legal

Este es un paquete no oficial desarrollado por la comunidad. Dixbase es una
marca registrada de sus respectivos propietarios. El autor no se hace
responsable del mal uso de este SDK o pérdidas financieras derivadas de su
implementación.


***

### ¿Qué cambios hice y por qué?
1.  **Badges:** Añadí uno para la versión de Pub (por si decides subirlo allí después).
2.  **Sección de Características:** La puse en lista con iconos para que sea más "escaneable" visualmente.
3.  **Manejo de Errores:** Añadí un bloque `try-catch` y un `finally { client.close() }` en el ejemplo de uso básico, ya que en Dart es una buena práctica cerrar los clientes HTTP para evitar fugas de memoria.
4.  **Aviso Legal:** Hice el aviso legal un poco más formal, algo estándar en SDKs que manejan dinero.
5.  **Instrucciones de Pub Get:** Añadí el comando para que el usuario sepa qué hacer tras editar el YAML.

**Recuerda cambiar `TU_USUARIO` en el enlace de GitHub antes de publicarlo.**
