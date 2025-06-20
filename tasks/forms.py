from django import forms
from .models import Tasks

class TaskForm(forms.ModelForm):
    STATUS_CHOICES = [
        ('pending', 'Pendiente'),
        ('in_progress', 'En progreso'),
        ('completed', 'Completada'),
    ]

    status = forms.ChoiceField(choices=STATUS_CHOICES)

    class Meta:
        model = Tasks
        fields = ['title', 'description', 'due_date', 'status', 'rick_morty_character_id']
        labels = {
            'title': 'Título',
            'description': 'Descripción',
            'due_date': 'Fecha de vencimiento',
            'status': 'Estado',
            'rick_morty_character_id': 'ID del personaje de Rick & Morty',
        }
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control'}),
            'due_date': forms.DateInput(
                attrs={'type': 'date', 'class': 'form-control'},
                format='%Y-%m-%d'
            ),
            'status': forms.Select(
                choices=[
                    ('pending', 'Pendiente'),
                    ('in_progress', 'En progreso'),
                    ('completed', 'Completada')
                ],
                attrs={'class': 'form-control'}
            ),
            'rick_morty_character_id': forms.NumberInput(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super(TaskForm, self).__init__(*args, **kwargs)
        self.fields['due_date'].input_formats = ['%Y-%m-%d']