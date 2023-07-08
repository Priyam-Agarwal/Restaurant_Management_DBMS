from django.db import models


# class AuthGroup(models.Model):
#     name = models.CharField(unique=True, max_length=150)

#     class Meta:
#         managed = True
#         db_table = 'auth_group'


# class AuthGroupPermissions(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#     permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

#     class Meta:
#         managed = True
#         db_table = 'auth_group_permissions'
#         unique_together = (('group', 'permission'),)


# class AuthPermission(models.Model):
#     name = models.CharField(max_length=255)
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
#     codename = models.CharField(max_length=100)

#     class Meta:
#         managed = True
#         db_table = 'auth_permission'
#         unique_together = (('content_type', 'codename'),)


# class AuthUser(models.Model):
#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=150)
#     last_name = models.CharField(max_length=150)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()

#     class Meta:
#         managed = True
#         db_table = 'auth_user'


# class AuthUserGroups(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

#     class Meta:
#         managed = True
#         db_table = 'auth_user_groups'
#         unique_together = (('user', 'group'),)


# class AuthUserUserPermissions(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

#     class Meta:
#         managed = True
#         db_table = 'auth_user_user_permissions'
#         unique_together = (('user', 'permission'),)


class Bill(models.Model):
    # Field name made lowercase.
    bill_no = models.IntegerField(db_column='BILL_NO', primary_key=True)
    # Field name made lowercase.
    price = models.IntegerField(db_column='PRICE', blank=True, null=True)
    # Field name made lowercase.
    order_dtl = models.CharField(
        db_column='ORDER_DTL', max_length=30, blank=True, null=True)
    # Field name made lowercase.
    cus = models.ForeignKey('Customer', models.DO_NOTHING,
                            db_column='CUS_ID', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'bill'

    def __str__(self):
        return self.cus


class BillDtl(models.Model):
    # Field name made lowercase.
    price = models.CharField(db_column='PRICE', max_length=15)
    # Field name made lowercase.
    vat = models.CharField(db_column='VAT', max_length=15)
    id = models.IntegerField(db_column="id", primary_key=True)

    class Meta:
        managed = True
        db_table = 'bill_dtls'

    def __str__(self):
        return self.id


class Chef(models.Model):
    # Field name made lowercase.
    chef_id = models.IntegerField(db_column='CHEF_ID', primary_key=True)
    # Field name made lowercase.
    chef_name = models.CharField(
        db_column='CHEF_NAME', max_length=30, blank=True, null=True)
    # Field name made lowercase.
    order_no = models.ForeignKey(
        'Order', models.DO_NOTHING, db_column='ORDER_NO')

    class Meta:
        managed = True
        db_table = 'chef'

    def __str__(self):
        return self.chef_name


class Customer(models.Model):
    # Field name made lowercase.
    cusid = models.IntegerField(db_column='CUSID', primary_key=True)
    # Field name made lowercase.
    cusname = models.CharField(
        db_column='CUSNAME', max_length=20, blank=True, null=True)
    # Field name made lowercase.
    cntno = models.IntegerField(db_column='CNTNO', blank=True, null=True)
    # Field name made lowercase.
    rid = models.ForeignKey('Restaurant', models.DO_NOTHING,
                            db_column='RID', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'customer'


# class DjangoAdminLog(models.Model):
#     action_time = models.DateTimeField()
#     object_id = models.TextField(blank=True, null=True)
#     object_repr = models.CharField(max_length=200)
#     action_flag = models.PositiveSmallIntegerField()
#     change_message = models.TextField()
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)

#     class Meta:
#         managed = True
#         db_table = 'django_admin_log'


# class DjangoContentType(models.Model):
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)

#     class Meta:
#         managed = True
#         db_table = 'django_content_type'
#         unique_together = (('app_label', 'model'),)


# class DjangoMigrations(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()

#     class Meta:
#         managed = True
#         db_table = 'django_migrations'


# class DjangoSession(models.Model):
#     session_key = models.CharField(primary_key=True, max_length=40)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()

#     class Meta:
#         managed = True
#         db_table = 'django_session'


class Food(models.Model):
    # Field name made lowercase.
    food_no = models.IntegerField(
        db_column='FOOD_NO', primary_key=True, null=False)
    quantity = models.IntegerField(db_column='QUANTITY', blank=True, null=True)
 # Field name made lowercase.
    # Field name made lowercase.
    description = models.CharField(
        db_column='DESCRIPTION', max_length=30, blank=True, null=True)
    # Field name made lowercase.
    order_no = models.ForeignKey(
        'Order', models.DO_NOTHING, db_column='ORDER_NO', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'food'

    def __str__(self):
        return str(self.food_no)


class FoodDetail(models.Model):
    # Field name made lowercase.
    food_no = models.ForeignKey(
        Food, models.DO_NOTHING, db_column='FOOD_NO', primary_key=True)
    quantity = models.IntegerField(db_column='QUANTITY', blank=True, null=True)
 # Field name made lowercase.
    # Field name made lowercase.
    price = models.IntegerField(db_column='PRICE', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'food_details'

    def __str__(self):
        return str(self.food_no)


class OrderInfo(models.Model):
    no_of_item = models.IntegerField(db_column='NO_OF_ITEM', primary_key=True)
# Field name made lowercase.
    # Field name made lowercase.
    oreder_time = models.CharField(db_column='OREDER_TIME', max_length=20)

    class Meta:
        managed = True
        db_table = 'order_info'

    def __str__(self):
        return self.no_of_item


class Order(models.Model):
    # Field name made lowercase.
    order_no = models.IntegerField(db_column='ORDER_NO', primary_key=True)
    # Field name made lowercase.
    no_of_item = models.IntegerField(db_column='NO_OF_ITEM')

    class Meta:
        managed = True
        db_table = 'order'

    def __str__(self):
        return str(self.order_no)


class Restaurant(models.Model):
    # Field name made lowercase.
    rid = models.IntegerField(db_column='RID', primary_key=True)
    # Field name made lowercase.
    rname = models.CharField(
        db_column='RNAME', max_length=20, blank=True, null=True)
    # Field name made lowercase.
    conatactno = models.IntegerField(
        db_column='CONATACTNO', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'restaurant'

    def __str__(self):
        return self.rname


class RestaurantInfo(models.Model):
    # Field name made lowercase.
    rname = models.CharField(
        db_column='RNAME', primary_key=True, max_length=30)
    # Field name made lowercase.
    address = models.CharField(
        db_column='ADDRESS', max_length=30, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'restaurant_info'

    def __str__(self):
        return self.rname


class Waiter(models.Model):
    # Field name made lowercase.
    wid = models.IntegerField(db_column='WID', primary_key=True)
    # Field name made lowercase.
    wname = models.CharField(
        db_column='WNAME', max_length=30, blank=True, null=True)
    # Field name made lowercase.
    cusid = models.ForeignKey(Customer, models.DO_NOTHING, db_column='CUSID')
    # Field name made lowercase.
    order_no = models.ForeignKey(
        'Order', models.DO_NOTHING, db_column='ORDER_NO')

    class Meta:
        managed = True
        db_table = 'waiter'

    def __str__(self):
        return self.wname
