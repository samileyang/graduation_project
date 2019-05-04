"""bishe URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mybishe import views
from django.conf.urls import url

urlpatterns = [
    url(r'^index/',views.index),
    url(r'^stu_info/',views.stu_info),
    url(r'^stu_index/',views.stu_index),
    url(r'^stu_login/',views.stu_login),
    url(r'^jwc_index/',views.jwc_index),
    url(r'^stu_library_borrow/',views.stu_library_borrow),
    url(r'^library_return/',views.library_return),
    url(r'^stu_sp_certification/',views.stu_sp_certification),
    url(r'^instructor_pro_review/',views.instructor_pro_review),
    url(r'^stu_products/',views.stu_products),
    url(r'^stu_pro_purchase/',views.stu_pro_purchase),
    url(r'^teacher_choose_course/',views.teacher_choose_course),
    url(r'^stu_choose_course/',views.stu_choose_course),
    url(r'^stu_book_lost/',views.stu_book_lost),
    url(r'^teacher_give_score/',views.teacher_give_score),
    url(r'^stu_skills_order/',views.stu_skills_order),
    url(r'^instructor_sp_confirm/',views.instructor_sp_confirm),
    url(r'^teacher_login/',views.teacher_login),
    url(r'^teacher_index/',views.teacher_index),
    url(r'^jwc_index/',views.jwc_index),
    url(r'^instructor_login/',views.instructor_login),
    url(r'^teacher_choose_order/',views.teacher_choose_order),
    url(r'^stu_choose_order/',views.stu_choose_order),
    url(r'^stu_delete_order/',views.stu_delete_order),
    url(r'^stu_borrow_order/',views.stu_borrow_order),
    url(r'^stu_book_return/',views.stu_book_return),
    url(r'^book_lost/',views.book_lost),
    url(r'^stu_job_certification/',views.stu_job_certification),
    url(r'^job_review/',views.job_review),
    url(r'^instructor_job_review/',views.instructor_job_review),
    url(r'^buy_products/',views.buy_products),
    url(r'^received_products/',views.received_products),
    url(r'^stu_cart/',views.stu_cart),
    url(r'^add_review/',views.add_review),
    url(r'^stu_pay_penalty/',views.stu_pay_penalty),
    url(r'^pay_penalty/',views.pay_penalty),
    url(r'^stu_course/',views.stu_course),
    url(r'^teacher_course/',views.teacher_course),
    url(r'^stu_buyer_comment/',views.stu_buyer_comment),
    url(r'^stu_seller_comment/',views.stu_seller_comment),
    url(r'^pro_review/',views.pro_review),
    url(r'^skills_order/',views.skills_order),
    url(r'^skills_review/',views.skills_review),
    url(r'^teacher_skills_review/',views.teacher_skills_review),
    url(r'^instructor_index/',views.instructor_index),
    url(r'^stu_appeal/',views.stu_appeal),
    url(r'^teacher_pen_review/',views.teacher_pen_review),
    url(r'^pen_review/',views.pen_review),
    url(r'^teacher_cheat/',views.teacher_cheat),
    url(r'^scholarship/',views.scholarship),
    url(r'^stu_scholarship/',views.stu_scholarship),
    url(r'^sch_order/',views.sch_order),
    url(r'^credit_score/',views.credit_score),
    url(r'^labor_score/',views.labor_score),
    url(r'^labor_index/',views.labor_index),
    url(r'^debt_score/',views.debt_score),
    url(r'^debt_index/',views.debt_index),
    url(r'^stu_index/',views.show_photo),
    
]
