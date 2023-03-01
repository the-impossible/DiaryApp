# Django Imports
from rest_framework import serializers
from Notes.models import Notes, Mood

class NoteSerializers(serializers.ModelSerializer):
    """_NoteSerializer_

    Args:
        serializers (_type_): _Serializing the Note model to for API calls_
    """
    class Meta:
        """Meta for the NoteSerializer"""
        model = Notes
        fields = ['id','title', 'mood', 'note', 'user_id', 'pic']


class MoodSerializers(serializers.ModelSerializer):
    """_MoodSerializer_

    Args:
        serializers (_type_): _Serializing the Mood model to for API calls_
    """
    class Meta:
        """Meta for the MoodSerializer"""
        model = Mood
        fields = ['id', 'mood',]
