from rest_framework import generics
from rest_framework import status
from rest_framework.response import Response
from rest_framework import permissions

# MyApp Import
from Notes.serializers import (
    NoteSerializers,
    MoodSerializers,
    AllNotesSerializers,
    DetailNotesSerializers,
)

from Notes.models import (
    Mood,
    Notes,
)
import base64
# Create your views here.
class CreateNoteView(generics.CreateAPIView):

    """This view create note for a user"""
    serializer_class = NoteSerializers
    permission_classes = (permissions.IsAuthenticated,)

    def create(self, request, *args, **kwargs):
        """Creates a note"""
        super().create(request, *args, **kwargs)
        return Response(status=status.HTTP_201_CREATED)

class GetMoodsView(generics.ListAPIView):
    """This view create note for a user"""
    serializer_class = MoodSerializers
    permission_classes = (permissions.IsAuthenticated,)
    model = Mood
    queryset = Mood.objects.all()

class GetNotesView(generics.ListAPIView):
    """This view gets all notes from a user"""
    serializer_class = AllNotesSerializers
    permission_classes = (permissions.IsAuthenticated,)
    model = Notes
    queryset = Notes.objects.all()

    def get_queryset(self):
        return Notes.objects.filter(user_id=self.request.user).order_by('-date_created')

class DetailNoteView(generics.RetrieveAPIView):
    """This view returns a user"""
    serializer_class = DetailNotesSerializers
    permission_classes = (permissions.IsAuthenticated,)

    def get_object(self):
        print(Notes.objects.get(pk=self.kwargs.get('note_id')))
        return Notes.objects.get(pk=self.kwargs.get('note_id'))

class EditNoteView(generics.UpdateAPIView):
    """This view returns a user"""
    serializer_class = NoteSerializers
    queryset = Notes.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


