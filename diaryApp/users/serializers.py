# Django Imports
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from django.core.files.storage import default_storage

import base64
# My App Import
from users.models import User

class UserSerializer(serializers.ModelSerializer):

    """Serializes the User model"""

    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all(), message='Email Already Exist')]
    )

    username = serializers.CharField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all(), message='Username Already Exist')],
    )

    password = serializers.CharField(
        required=True,
        write_only=True,
        validators=[validate_password],
        style={
            "input_type":"password"
        }
    )

    image = serializers.SerializerMethodField("get_image")

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['id','username', 'name', 'email', 'password', 'pic', 'phone', 'image']

    def create(self, validated_data):

        user = User.objects.create_user(
            validated_data['username'],
            validated_data['email'],
            validated_data['name'],
            validated_data['password']
        )

        user.save()

        return user

    def get_image(self, user:User):
        """IMAGE"""
        file = default_storage.open(user.pic.name, 'rb')
        data = file.read()
        file.close()
        return base64.b64encode(data)
