"""
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
"""

from django.contrib import admin
from django.urls import path
from one.views import start

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", start,name="index"),
]
