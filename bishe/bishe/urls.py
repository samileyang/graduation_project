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
]
