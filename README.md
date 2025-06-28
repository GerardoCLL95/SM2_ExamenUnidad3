# SM2_ExamenUnidad3 - Control de Asistencia

**Nombre del Curso:** Soluciones Móviles ll

**Fecha:** 27 de junio de 2025

**Nombres Completos del Estudiante:** Gerardo Alejandro Concha Llaca

---

## URL del Repositorio

https://github.com/GerardoCLL95/SM2_ExamenUnidad3?tab=readme-ov-file
---

## Evidencia de Configuración y Ejecución del Workflow

A continuación se presentan las capturas de pantalla que demuestran la correcta configuración y ejecución del workflow de Quality Check.

### Estructura de Carpetas `.github/workflows/`

![image](https://github.com/user-attachments/assets/0a9888ff-a97e-4ec2-8732-499f7f25d16e)
![image](https://github.com/user-attachments/assets/0163da0b-20e7-48be-b83a-b6112b9bfc44)

### Contenido del Archivo `quality-check.yml`

![image](https://github.com/user-attachments/assets/ac181605-481f-484c-bf46-1f09f47917bd)

### Ejecución del Workflow en la Pestaña Actions

![image](https://github.com/user-attachments/assets/465681f0-6e88-4973-9efa-a0efff4efd98)

### Explicación de lo Realizado:

Para asegurar la calidad del código y mantener un estándar en el proyecto SM2_ExamenUnidad3, se ha implementado un workflow de GitHub Actions que ejecuta el comando flutter analyze en cada push al repositorio.

El objetivo principal de esta configuración de CI/CD es:

Detección Temprana de Problemas: Identificar y reportar advertencias y sugerencias del linter de Flutter de forma automática, antes de que el código sea fusionado a la rama principal.

Mantenimiento del Estilo de Código: Forzar la aplicación de convenciones de nombrado, uso de const, y buenas prácticas para mejorar la legibilidad y el rendimiento del código.

Prevención de Errores Comunes: Capturar situaciones como el uso incorrecto de BuildContext en contextos asíncronos o la presencia de print statements en código de producción.
