from rest_framework import generics
from rest_framework import status
from rest_framework.response import Response
from rest_framework import permissions

# MyApp Import
from Notes.serializers import (
    NoteSerializers,
    MoodSerializers,
)

from Notes.models import (
    Mood,
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

