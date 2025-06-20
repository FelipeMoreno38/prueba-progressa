from django.shortcuts import render, redirect
from .forms import RegisterForm, LoginForm
from .models import Users
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages

def register_view(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            # Encriptar contraseña antes de guardar
            encrypted_password = make_password(form.cleaned_data['password'])

            user = Users(
                email=form.cleaned_data['email'],
                password=encrypted_password
            )
            user.save()
            messages.success(request, 'Usuario registrado con éxito.')
            return redirect('login')
    else:
        form = RegisterForm()

    return render(request, 'users/register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            try:
                user = Users.objects.get(email=form.cleaned_data['email'])

                if check_password(form.cleaned_data['password'], user.password):
                    request.session['user_id'] = user.id
                    messages.success(request, "Inicio de sesión exitoso.")
                    return redirect('task_list')
                else:
                    messages.error(request, "Contraseña incorrecta.")
            except Users.DoesNotExist:
                messages.error(request, "Usuario no encontrado.")
    else:
        form = LoginForm()

    return render(request, 'users/login.html', {'form': form})

def logout_view(request):
    request.session.flush()
    return redirect('login')