from django.urls import path

# MyApp
from Notes.views import (
    CreateNoteView,
    GetMoodsView,
)

app_name = "notes"

urlpatterns = [
    path("create_note/", CreateNoteView.as_view(), name="create_note"),
    path("get_moods/", GetMoodsView.as_view(), name="get_moods"),
]
