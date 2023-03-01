from django.contrib import admin

# My App imports
from Notes.models import (
    Notes,
    Mood,
)

# Register your models here.
admin.site.register(Notes)
admin.site.register(Mood)
