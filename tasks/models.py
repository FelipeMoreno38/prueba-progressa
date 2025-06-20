from django.db import models
from users.models import Users

class Tasks(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE, db_column='user_id')
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, db_collation='Modern_Spanish_CI_AS')
    description = models.TextField(db_collation='Modern_Spanish_CI_AS', blank=True, null=True)  # This field type is a guess.
    due_date = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=20, db_collation='Modern_Spanish_CI_AS')
    rick_morty_character_id = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    def get_status_display_es(self):
        return {
            'pending': 'Pendiente',
            'in_progress': 'En progreso',
            'completed': 'Completada'
        }.get(self.status, self.status)

    class Meta:
        managed = False
        db_table = 'tasks'


