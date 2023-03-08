# Django Imports
from rest_framework import serializers
from Notes.models import Notes, Mood
from django.core.files.storage import default_storage
import base64

class NoteSerializers(serializers.ModelSerializer):
    """_NoteSerializer_

    Args:
        serializers (_type_): _Serializing the Note model to for API calls_
    """

    class Meta:
        """Meta for the NoteSerializer"""
        model = Notes
        fields = ['id','title', 'mood', 'note', 'user_id', 'pic', 'date_created']


class AllNotesSerializers(serializers.ModelSerializer):
    """_NoteSerializer_

    Args:
        serializers (_type_): _Serializing the Note model to for API calls_
    """
    mood = serializers.PrimaryKeyRelatedField(source='mood.mood', queryset=Mood.objects.all(), many=False)
    # mood = models
    class Meta:
        """Meta for the NoteSerializer"""
        model = Notes
        fields = ['id','title','mood','date_created']

class DetailNotesSerializers(serializers.ModelSerializer):
    """_NoteSerializer_

    Args:
        serializers (_type_): _Serializing the Note model to for API calls_
    """
    mood = serializers.PrimaryKeyRelatedField(source='mood.mood', queryset=Mood.objects.all(), many=False)
    pic = serializers.SerializerMethodField("get_image")
    # mood = models
    class Meta:
        """Meta for the NoteSerializer"""
        model = Notes
        fields = ['id','title','mood','note','date_created','pic']

    def get_image(self, note:Notes):
        """IMAGE"""
        file = default_storage.open(note.pic.name, 'rb')
        data = file.read()
        file.close()
        return base64.b64encode(data)


class MoodSerializers(serializers.ModelSerializer):
    """_MoodSerializer_

    Args:
        serializers (_type_): _Serializing the Mood model to for API calls_
    """
    class Meta:
        """Meta for the MoodSerializer"""
        model = Mood
        fields = ['id', 'mood',]
