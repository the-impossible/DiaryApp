"""diaryApp URL Configuration

"""
from django.contrib import admin
from django.urls import path
from django.urls import include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path("users/", include('users.urls', namespace="users")),
    path("auth/", include('authTokens.urls', namespace="auth")),
    path("notes/", include('Notes.urls', namespace="notes")),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

admin.site.site_header = "Diary Application"
admin.site.site_title = "Diary Application"
admin.site.index_title = "Welcome to Diary Mobile App"
