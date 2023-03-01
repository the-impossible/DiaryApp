# Generated by Django 4.1.7 on 2023-02-28 17:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Mood",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("mode", models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name="Notes",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(max_length=500)),
                ("note", models.TextField()),
                (
                    "pic",
                    models.ImageField(
                        blank=True, null=True, upload_to="uploads/notes/"
                    ),
                ),
                (
                    "mood",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="Notes.mood"
                    ),
                ),
            ],
        ),
    ]
