from django.db import models

# My app imports
from users.models import User

# Create your models here.
class Mood(models.Model):
    """_Mood_

    Args:
        models (_type_): Mood Object
    """
    mood = models.CharField(max_length=20)

    def __str__(self):
        return f'{self.mood}'

    class Meta:
        """_additional attributes to the model Mood_
    """
        verbose_name_plural = 'Mood'


class Notes(models.Model):
    """_Notes_

    Args:
        models (_type_): Notes Object
    """
    title = models.CharField(max_length=500)
    user_id = models.ForeignKey(to=User, on_delete=models.CASCADE)
    note = models.TextField()
    mood = models.ForeignKey(Mood, on_delete=models.CASCADE)
    pic = models.ImageField(null=True, blank=True, upload_to='uploads/notes/')
    date_created = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.title}'

    class Meta:
        """_additional attributes to the model Notes_
        """
        verbose_name_plural = 'Notes'
