# Generated by Django 3.1.4 on 2021-01-21 20:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modelo', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cliente',
            name='direccion',
            field=models.TextField(max_length=200),
        ),
    ]
