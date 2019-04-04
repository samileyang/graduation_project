from django.shortcuts import render
from mybishe import models
from django.db.models import F
# Create your views here.
def stu_info(request):
	dorms = models.Dorm.objects.all()
	majors = models.Major.objects.all()
	educations = models.BorrowRule.objects.all()
	instructors = models.Instructor.objects.all()
	stu_pwd = request.POST.get('stu_pwd')
	stu_name = request.POST.get('stu_name')
	bed_id = request.POST.get('bed_id')
	year = request.POST.get('year')
	major_id = request.POST.get('major_id')
	money = 100
	stu_edu = request.POST.get('stu_edu')
	instructor_id = request.POST.get('instructor_id')
	students = models.Student(stu_pwd = stu_pwd,stu_name=stu_name,stu_year=year,major_id=major_id,stu_edu=stu_edu,instructor_id=instructor_id,bed_id=bed_id,money = money)
	students.save()
	try:
		dorm = models.Dorm.objects.get(bed_id = bed_id)
		dorm.status = 1
		dorm.save()
	except:
		pass
	return render(request,'jwc/stu_info.html',{'dorms': dorms,'majors' : majors,'educations': educations,'instructors': instructors})

def stu_login(request):
	if request.method == 'GET':
		return render(request, 'student/stu_login.html')
	if request.method == 'POST':
		user = models.Student.objects.get(stu_id = request.POST['stu_id'])
		request.session['stu_name'] = user.stu_name
		request.session['stu_id'] = user.stu_id
		return render(request,'student/stu_index.html')

def stu_index(request):
	return render(request,'student/stu_index.html')

def stu_library_borrow(request):
	borrows = models.Borrow.objects.filter(status ='0')
	return render(request,'student/stu_library_borrow.html',{'borrows':borrows})

def library_return(request):
	orders = models.BorrowOrder.objects.all()
	return render(request,'jwc/library_return.html',{'orders':orders})

def stu_sp_certification(request):
	certifications = models.Rules.objects.all()
	return render(request,'student/stu_sp_certification.html',{'certifications':certifications})

def stu_products(request):
	try:
		pro_name = request.POST.get('product_name')
		price_org = request.POST.get('price_org')
		price_cur = request.POST.get('price_cur')
		location = request.POST.get('location')
		seller_id = request.session.get('stu_id',None)
		status = 0
		products = models.Products(pro_name = pro_name,price_org = price_org,price_cur = price_cur,seller_id = seller_id,location = location,status = status)
		products.save()
		return render(request,'student/stu_products.html')
	except:
		return render(request,'student/stu_products.html')

def instructor_pro_review(request):
	products = models.Products.objects.filter(status=0)
	return render(request,'instructor/instructor_pro_review.html',{'products':products})

def stu_pro_purchase(request):
	products = models.Products.objects.filter(status=1)
	return render(request,'student/stu_pro_purchase.html',{'products':products})

def teacher_choose_course(request):
	courses = models.CultivatePlan.objects.filter(class_field__lt=F('limit'))
	return render(request,'teacher/teacher_choose_course.html',{'courses':courses})

def stu_choose_course(request):
	students = models.StudentChoice.objects.filter(stu_id=request.session.get("stu_id"))
	stu_list = []
	for student in students:
		stu_list.append(student.course_id)
	courses = models.TeacherChoice.objects.all()
	return render(request,'student/stu_choose_course.html',{'courses':courses,'stu_list':stu_list})

def stu_book_lost(request):
	books = models.BorrowOrder.objects.filter(stu_id = 1,return_status = 0)
	return render(request,'student/stu_book_lost.html',{'books':books})

def teacher_give_score(request):
	students = models.StudentChoice.objects.filter(score = 0)
	return render(request,'teacher/teacher_give_score.html',{'students':students})

def stu_skills_order(request):
	courses = models.StudentChoice.objects.filter(score__gte=90, stu_id = request.session.get('stu_id'))
	return render(request,'student/stu_skills_order.html',{'courses':courses})

def instructor_sp_confirm(request):
	students = models.AddCreditOrder.objects.filter(status = 0)
	return render(request,'instructor/instructor_sp_confirm.html',{"students":students})

def teacher_login(request):
	if request.method == 'GET':
		return render(request, 'teacher/teacher_login.html')
	if request.method == 'POST':
		user = models.Teacher.objects.get(tea_id = request.POST['teacher_id'])
		request.session['teacher_name'] = user.teacher_name
		request.session['teacher_id'] = user.tea_id
		return render(request,'teacher/teacher_index.html')

def teacher_index(request):
	return render(request,'teacher/teacher_index.html')

def jwc_index(request):
	return render(request,'jwc/jwc_index.html')

def index(request):
	return render(request,'index.html')

def instructor_login(request):
	if request.method == 'GET':
		return render(request, 'instructor/instructor_login.html')
	if request.method == 'POST':
		user = models.Instructor.objects.get(instructor_id = request.POST['instructor_id'])
		request.session['instructor_name'] = user.instructor_name
		request.session['instructor_id'] = user.instructor_id
		return render(request,'instructor/instructor_pro_review.html')

def teacher_choose_order(request):
	cultivate = models.CultivatePlan.objects.get(course_id = request.GET.get('course_id',None))
	cultivate.class_field += 1
	status = 0
	time = cultivate.time
	teacher_id = request.session.get('teacher_id',None)
	certification = cultivate.certification
	year = 2019
	teacher_choose = models.TeacherChoice(course_year = year,status = status,time = time,certification = certification,teacher_id = teacher_id,course_id = request.GET.get('course_id'))
	teacher_choose.save()
	cultivate.save()
	courses = models.CultivatePlan.objects.filter(class_field__lt=F('limit'))
	return render(request,'teacher/teacher_choose_course.html',{'courses':courses})

def stu_choose_order(request):
	teacher_course = models.TeacherChoice.objects.get(teacher_choice_id = request.GET.get('teacher_choice_id',None))
	teacher_choice_id = request.GET.get('teacher_choice_id',None)
	stu_id = request.session.get("stu_id")
	course_id = teacher_course.course_id
	save_course = models.StudentChoice(teacher_choice_id= teacher_choice_id,stu_id = stu_id, course_id =course_id)
	save_course.save()
	students = models.StudentChoice.objects.filter(stu_id=request.session.get("stu_id"))
	stu_list = []
	for student in students:
		stu_list.append(student.course_id)
	courses = models.TeacherChoice.objects.all()
	return render(request,'student/stu_choose_course.html',{'courses':courses,'stu_list':stu_list})

def stu_delete_order(request):
	models.StudentChoice.objects.get(teacher_choice_id = request.GET.get('teacher_choice_id',None)).delete()
	students = models.StudentChoice.objects.filter(stu_id=request.session.get("stu_id"))
	stu_list = []
	for student in students:
		stu_list.append(student.course_id)
	courses = models.TeacherChoice.objects.all()
	return render(request,'student/stu_choose_course.html',{'courses':courses,'stu_list':stu_list})