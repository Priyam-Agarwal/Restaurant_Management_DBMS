from django.contrib import admin

# Register your models here.

from .models import *

# admin.site.register(Customer)


@admin.register(Customer)
class CustomerInfo(admin.ModelAdmin):
    list_display = ("cusname", "cusid", "cntno", "rid")
    ordering = ("cusname",)
    search_fields = ("cusname", "cntno")


admin.site.register(BillDtl)
# admin.site.unregister(Orderr)
admin.site.register(Order)

admin.site.register(Food)
# admin.site.unregister(Food)

admin.site.register(FoodDetail)
# admin.site.unregister(Food_Detail)

admin.site.register(OrderInfo)
# admin.site.unregister(Order_Info)

admin.site.register(Chef)

admin.site.register(RestaurantInfo)
admin.site.register(Waiter)
admin.site.register(Bill)
# admin.site.unregister(Chef)
