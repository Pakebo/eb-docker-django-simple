from django.contrib import admin
from djapp.models import Enrollment

class EnrollmentAdmin(admin.ModelAdmin):
    list_display = ('member_id', 'comment', 'creation_date', 'status', )

    fields = ('member_id', 'comment', 'status', )


admin.site.register(Enrollment, EnrollmentAdmin)

