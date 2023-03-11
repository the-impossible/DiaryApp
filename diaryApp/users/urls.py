from django.urls import path

# MyApp
from users.views import (
    RegisterView,
    UserView,
    UpdateUserView,
    ChangePasswordView,
)

app_name = "users"

urlpatterns = [
    path("register/", RegisterView.as_view(), name="register"),
    path("user/", UserView.as_view(), name="user"),
    path("updateUser/<str:pk>", UpdateUserView.as_view(), name="updateUser"),
    path("change_password/<str:pk>", ChangePasswordView.as_view(), name="change_password"),
]
