import requests

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from .forms import TaskForm
from .models import Tasks, Users

def task_list(request):
    # Redireccionar a login si no se ha iniciado sesión
    if 'user_id' not in request.session:
        return redirect('login')

    # Obtener tareas
    tareas = Tasks.objects.filter(user_id=request.session['user_id'])

    for tarea in tareas:
        if tarea.rick_morty_character_id:
            # Consultar en la Api de Rick y Morti el personaje por el id almacenado en la tabla
            response = requests.get(
                f"https://rickandmortyapi.com/api/character/{tarea.rick_morty_character_id}"
            )
            if response.status_code == 200:
                data = response.json()
                tarea.rick_morty_character = data
            else:
                tarea.rick_morty_character = None
        else:
            tarea.rick_morty_character = None

    return render(request, 'tasks/task_list.html', {'tasks': tareas})

def task_create(request):
    if 'user_id' not in request.session:
        return redirect('login')

    # Crear tarea
    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            task = form.save(commit=False)
            task.user = Users.objects.get(id=request.session['user_id'])
            task.save()
            messages.success(request, f"La tarea fue creada correctamente.")
            return redirect('task_list')
    else:
        form = TaskForm()
    return render(request, 'tasks/task_form.html', {'form': form})

def task_edit(request, id):
    if 'user_id' not in request.session:
        return redirect('login')

    task = get_object_or_404(Tasks, id=id, user_id=request.session['user_id'])

    # Actualizar la tarea
    if request.method == 'POST':
        form = TaskForm(request.POST, instance=task)
        if form.is_valid():
            task = form.save(commit=False)
            task.save()
            messages.success(request, f"La tarea '{task.title}' fue editada correctamente.")
            return redirect('task_list')
    else:
        form = TaskForm(instance=task)

    return render(request, 'tasks/task_form.html', {'form': form})

def task_delete(request, id):
    if 'user_id' not in request.session:
        return redirect('login')

    # Obtener tarea por id y eliminarla
    task = get_object_or_404(Tasks, id=id, user_id=request.session['user_id'])
    task.delete()
    messages.success(request, f"La tarea '{task.title}' fue eliminada correctamente.")
    return redirect('task_list')


def character_list(request):    
    response = requests.get("https://rickandmortyapi.com/api/character")
    characters = []

    if response.status_code == 200:
        data = response.json()
        characters = data['results']  # Lista de personajes

    return render(request, 'characters/character_list.html', {'characters': characters})

def character_list(request):
    page = request.GET.get('page', 1)  # paginar por defecto, página 1
    # Se llama la API de Rick and Morty para listar personajes
    url = f"https://rickandmortyapi.com/api/character?page={page}"

    response = requests.get(url)
    characters = []
    pagination = {}

    if response.status_code == 200:
        data = response.json()
        characters = data['results']
        pagination = data['info']  # contiene: count, pages, next, prev, especificado en la prueba

    return render(request, 'characters/character_list.html', {
        'characters': characters,
        'pagination': pagination,
        'current_page': int(page)
    })