# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AddCreditOrder(models.Model):
    add_id = models.AutoField(primary_key=True)
    stu_id = models.IntegerField(blank=True, null=True)
    rule_id = models.IntegerField(blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    rule_name = models.CharField(max_length=255, blank=True, null=True)
    comment = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'add_credit_order'


class Borrow(models.Model):
    book_id = models.AutoField(primary_key=True)
    book_name = models.CharField(max_length=255, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        
        db_table = 'borrow'


class BorrowOrder(models.Model):
    borrow_id = models.AutoField(primary_key=True)
    stu_id = models.IntegerField(blank=True, null=True)
    book_id = models.IntegerField(blank=True, null=True)
    startdate = models.DateTimeField(blank=True, null=True)
    supposedate = models.DateTimeField(blank=True, null=True)
    actdate = models.DateTimeField(blank=True, null=True)
    return_status = models.IntegerField(blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        
        db_table = 'borrow_order'


class BorrowRule(models.Model):
    education = models.CharField(primary_key=True, max_length=255)
    day = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'borrow_rule'


class Certification(models.Model):
    certi_id = models.AutoField(primary_key=True)
    student_choice_id = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'certification'


class Cheat(models.Model):
    cheat_id = models.AutoField(primary_key=True)
    stu_id = models.IntegerField(blank=True, null=True)
    student_choice_id = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'cheat'


class Credit(models.Model):
    status = models.IntegerField(blank=True, null=True)
    credit_id = models.AutoField(primary_key=True)
    stu_id = models.IntegerField(blank=True, null=True)
    year = models.TextField(blank=True, null=True)  # This field type is a guess.
    score = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'credit'


class CultivatePlan(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=255, blank=True, null=True)
    major_id = models.IntegerField(blank=True, null=True)
    credit = models.IntegerField(blank=True, null=True)
    grade = models.IntegerField(blank=True, null=True)
    semester = models.IntegerField(blank=True, null=True)
    time = models.CharField(max_length=255, blank=True, null=True)
    certification = models.IntegerField(blank=True, null=True)
    class_field = models.IntegerField(db_column='class', blank=True, null=True)  # Field renamed because it was a Python reserved word.
    limit = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'cultivate_plan'


class DebtScore(models.Model):
    stu_id = models.IntegerField(blank=True, null=True)
    stu_name = models.CharField(max_length=255, blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)
    rank = models.IntegerField(primary_key=True, max_length=255)

    class Meta:
        
        db_table = 'debt_score'


class Instructor(models.Model):
    instructor_id = models.AutoField(primary_key=True)
    instructor_name = models.CharField(max_length=255, blank=True, null=True)
    instructor_pwd = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'instructor'


class JobCertification(models.Model):
    status = models.IntegerField(blank=True, null=True)
    stu_id = models.IntegerField(blank=True, null=True)
    job_id = models.AutoField(primary_key=True)
    job_name = models.CharField(max_length=255, blank=True, null=True)
    days = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'job_certification'


class LaborScore(models.Model):
    stu_id = models.IntegerField(blank=True, null=True)
    stu_name = models.CharField(max_length=255, blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)
    rank = models.IntegerField(primary_key=True)

    class Meta:
        
        db_table = 'labor_score'


class Major(models.Model):
    major_id = models.AutoField(primary_key=True)
    major_name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'major'


class Orders(models.Model):
    order_id = models.AutoField(primary_key=True)
    product_id = models.IntegerField(blank=True, null=True)
    buyer_id = models.IntegerField(blank=True, null=True)
    seller_comm = models.IntegerField(blank=True, null=True)
    buyer_comm = models.IntegerField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    received = models.IntegerField(blank=True, null=True)
    seller_id = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'orders'


class PenAppeal(models.Model):
    pen_appeal_id = models.AutoField(primary_key=True)
    stu_pen_id = models.IntegerField(blank=True, null=True)
    teacher_id = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'pen_appeal'


class Penalty(models.Model):
    stu_pen_id = models.AutoField(primary_key=True)
    pen_type = models.CharField(max_length=255, blank=True, null=True)
    borrow_id = models.IntegerField(blank=True, null=True)
    pen_money = models.IntegerField(blank=True, null=True)
    paid = models.IntegerField(blank=True, null=True)
    appeal = models.IntegerField(blank=True, null=True)
    stu_id = models.IntegerField(blank=True, null=True)
    teacher_id = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'penalty'


class Products(models.Model):
    pro_id = models.AutoField(primary_key=True)
    pro_name = models.CharField(max_length=255, blank=True, null=True)
    price_org = models.IntegerField(blank=True, null=True)
    price_cur = models.IntegerField(blank=True, null=True)
    seller_id = models.IntegerField(blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    paid = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'products'


class Rules(models.Model):
    rule_id = models.AutoField(primary_key=True)
    rule_name = models.CharField(max_length=255, blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'rules'


class Scholarship(models.Model):
    sch_id = models.AutoField(primary_key=True)
    stu_id = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    money = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'scholarship'


class SepScore(models.Model):
    sep_id = models.AutoField(primary_key=True)
    score_type = models.CharField(max_length=255, blank=True, null=True)
    stu_id = models.IntegerField(blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)
    rank = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'sep_score'


class Student(models.Model):
    stu_id = models.AutoField(primary_key=True)
    stu_pwd = models.CharField(max_length=255, blank=True, null=True)
    stu_name = models.CharField(max_length=255, blank=True, null=True)
    stu_year = models.TextField(blank=True, null=True)  # This field type is a guess.
    major_name = models.CharField(max_length=255, blank=True, null=True)
    money = models.IntegerField(blank=True, null=True)
    stu_edu = models.CharField(max_length=255, blank=True, null=True)
    bed_id = models.IntegerField(blank=True, null=True)
    dorm_id = models.IntegerField(blank=True, null=True)
    instructor_id = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'student'


class StudentChoice(models.Model):
    student_choice_id = models.AutoField(primary_key=True)
    teacher_choice_id = models.IntegerField(blank=True, null=True)
    score = models.IntegerField(blank=True, null=True)
    stu_id = models.IntegerField(blank=True, null=True)
    course_id = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'student_choice'


class Teacher(models.Model):
    tea_id = models.AutoField(primary_key=True)
    teacher_name = models.CharField(max_length=255, blank=True, null=True)
    major_id = models.IntegerField(blank=True, null=True)
    tea_pwd = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        
        db_table = 'teacher'


class TeacherChoice(models.Model):
    teacher_choice_id = models.AutoField(primary_key=True)
    teacher_id = models.IntegerField(blank=True, null=True)
    course_id = models.IntegerField(blank=True, null=True)
    course_year = models.TextField(blank=True, null=True)  # This field type is a guess.
    status = models.IntegerField(blank=True, null=True)
    time = models.CharField(max_length=225, blank=True, null=True)
    certification = models.IntegerField(blank=True, null=True)

    class Meta:
        
        db_table = 'teacher_choice'
