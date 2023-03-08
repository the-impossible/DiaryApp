from django.urls import path

# MyApp
from Notes.views import (
    CreateNoteView,
    GetMoodsView,
    GetNotesView,
    DetailNoteView,
    EditNoteView,
)

app_name = "notes"

urlpatterns = [
    path("create_note/", CreateNoteView.as_view(), name="create_note"),
    path("get_moods/", GetMoodsView.as_view(), name="get_moods"),
    path("get_notes/", GetNotesView.as_view(), name="get_notes"),
    path("detail_note/<str:note_id>", DetailNoteView.as_view(), name="detail_note"),
    path("edit_note/<str:pk>", EditNoteView.as_view(), name="edit_note"),
]
