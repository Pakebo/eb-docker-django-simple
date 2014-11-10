# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Enrollment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('member_id', models.CharField(unique=True, max_length=40)),
                ('comment', models.CharField(default=b'No comment', max_length=200, blank=True)),
                ('creation_date', models.DateTimeField(auto_now=True, verbose_name=b'Creation date')),
                ('status', models.CharField(default=b'INVALID', max_length=40, choices=[(b'VALID', b'Valid'), (b'INVALID', b'Invalid')])),
            ],
            options={
                'ordering': ('-creation_date',),
            },
            bases=(models.Model,),
        ),
    ]
