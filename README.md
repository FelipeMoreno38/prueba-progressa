# 📋 Prueba Técnica Progressa - Gestor de Tareas con Rick and Morty API

Aplicación web desarrollada en Django que permite la gestión de tareas por usuario, con integración a la API de Rick and Morty para asociar personajes.

---

## Requisitos

- Python 3.10+
- pip
- (Opcional) Virtualenv
- Base de datos: SQL Server

---

## Instalación

1. Clonar el repositorio:

```bash
git clone https://github.com/FelipeMoreno38/prueba-progressa.git
cd prueba-progresa

python -m venv venv

source venv/Scripts/activate  # En Windows

pip install -r requirements.txt

# Usando SSMS o herramienta SQL
-- Abrir y ejecutar el archivo database_dump.sql con SQL Server Management Studio (SSMS) u otra herramienta.

# Configurar la conexión en prueba_progresa/settings.py
DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'nombre_base_datos',
        'USER': 'usuario',
        'PASSWORD': 'contraseña',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    }
}

# Ejecutar las migraciones
python manage.py migrate
python manage.py runserver
```

👤 Usuario demo
Puedes iniciar sesión con:

Usuario: admin@mail.com

Contraseña: admin123
