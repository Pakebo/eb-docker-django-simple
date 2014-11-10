from django.db import models


STATUS_CHOICES = (
    ('VALID',   'Valid'),
    ('INVALID', 'Invalid'),
)


class Enrollment(models.Model):
    member_id       = models.CharField(max_length=40, unique=True)
    comment         = models.CharField(max_length=200, blank=True, default="No comment")
    creation_date   = models.DateTimeField('Creation date', auto_now = True)
    status          = models.CharField(max_length=40, choices=STATUS_CHOICES, default="INVALID")

    class Meta:
        ordering = ('-creation_date', )

    def __unicode__(self):
        return  "This is " + self.member_id + \
                "'s enrollment on " + self.creation_date.strftime("%d/%m") + \
                " at " + self.creation_date.strftime("%H:%M:%S")


