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

class EditUserSerializer(serializers.ModelSerializer):

    """Serializes the User model"""

    image = serializers.SerializerMethodField("get_image")

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['id','username', 'name', 'email', 'phone', 'image', 'pic']

    def get_image(self, user:User):
        """IMAGE"""
        file = default_storage.open(user.pic.name, 'rb')
        data = file.read()
        file.close()
        return base64.b64encode(data)

class ChangePassSerializer(serializers.ModelSerializer):

    """Changes the User Password"""

    password0 = serializers.CharField(
        required=True,
        write_only=True,
    )
    password1 = serializers.CharField(
        required=True,
        write_only=True,
    )
    password2 = serializers.CharField(
        required=True,
        write_only=True,
    )

    def validate(self, attrs):
        if attrs['password1'] != attrs['password2']:
            raise serializers.ValidationError(({"password":"Password fields didn't match!"}))

        return attrs

    def validate_password0(self, value):
        user = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError({"password0":"Old password is incorrect!"})
        return value

    def update(self, instance, validated_data):
        instance.set_password(validated_data['password1'])
        instance.save()
        return instance

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['password0','password1','password2']