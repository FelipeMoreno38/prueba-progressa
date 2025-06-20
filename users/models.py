from django.db import models

class Users(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.CharField(unique=True, max_length=255, db_collation='Modern_Spanish_CI_AS')
    password = models.CharField(max_length=255, db_collation='Modern_Spanish_CI_AS')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'users'