from django.shortcuts import render
from mybishe import models
from django.db.models import F
import datetime
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

def stu_borrow_order(request):
	mybook = models.Borrow.objects.get(book_id = request.GET.get('book_id',None))
	stu_id = request.session.get('stu_id',None)
	book_id = request.GET.get('book_id',None)
	now = datetime.datetime.now()
	delta = datetime.timedelta(days=90)
	n_days = now + delta
	price = mybook.price
	borrow_order = models.BorrowOrder(stu_id = stu_id,book_id=book_id,startdate=now,supposedate = n_days, penatly_status = 0,appeal_status = 0, return_status = 0,price = price)
	mybook.status = '1'
	mybook.save()
	borrow_order.save()
	borrows = models.Borrow.objects.filter(status ='0')
	return render(request,'student/stu_library_borrow.html',{'borrows':borrows})

def library_return(request):
	orders = models.BorrowOrder.objects.filter(return_status = '0')
	return render(request,'jwc/library_return.html',{'orders':orders})

def stu_book_return(request):
	book_id = request.GET.get('book_id',None)
	borrow_order = models.BorrowOrder.objects.get(return_status = '0', book_id = book_id)
	models.Borrow.objects.filter(book_id = book_id).update(status = '0')
	borrow_order.return_status = 1
	borrow_order.actdate = datetime.datetime.now()
	borrow_order.save()
	orders = models.BorrowOrder.objects.filter(return_status = '0')
	return render(request,'jwc/library_return.html',{'orders':orders})


def stu_sp_certification(request):
	certifications = models.Rules.objects.all()
	return render(request,'student/stu_sp_certification.html',{'certifications':certifications})

def stu_products(request):
	if request.method =='POST':
		pro_name = request.POST.get('product_name')
		price_org = request.POST.get('price_org')
		price_cur = request.POST.get('price_cur')
		location = request.POST.get('location')
		seller_id = request.session.get('stu_id',None)
		status = 0
		products = models.Products(pro_name = pro_name,price_org = price_org,price_cur = price_cur,seller_id = seller_id,location = location,status = status)
		products.save()
		return render(request,'student/stu_products.html')
	if request.method =="GET":
		return render(request,'student/stu_products.html')

def instructor_pro_review(request):
	products = models.Products.objects.filter(status=0)
	return render(request,'instructor/instructor_pro_review.html',{'products':products})

def stu_pro_purchase(request):
	products = models.Products.objects.filter(status=1)
	return render(request,'student/stu_pro_purchase.html',{'products':products})

def buy_products(request):
	pro_id = request.GET.get('pro_id',None)
	buyer_id = request.session.get('stu_id')
	myproduct = models.Products.objects.get(pro_id = pro_id)
	price_cur = myproduct.price_cur
	seller_id = myproduct.seller_id
	myproduct.paid = 1
	myproduct.save()
	moneychange = models.Student.objects.get(stu_id= buyer_id)
	moneychange.money -= price_cur
	moneychange.save()
	addproduct = models.Orders(product_id = pro_id,buyer_id = buyer_id,price = price_cur,received = 0,seller_id = seller_id)
	addproduct.save()
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

def book_lost(request):
	borrow_id = request.GET.get('borrow_id',None)
	mybook = models.BorrowOrder.objects.get(borrow_id=borrow_id)
	mybook.actdate = datetime.datetime.now()
	mybook.penatly_status = 1
	mybook.return_status = 1
	stu_id = mybook.stu_id
	students = models.Student.objects.get(stu_id = stu_id)
	price = mybook.price
	penatly = models.Penalty(borrow_id = borrow_id,stu_id = stu_id, pen_money = price)
	mybook.save()
	penatly.save()
	books = models.BorrowOrder.objects.filter(stu_id = 1,return_status = 0)
	return render(request,'student/stu_book_lost.html',{'books':books})

def teacher_give_score(request):
	students = models.StudentChoice.objects.filter(score__isnull=True)
	return render(request,'teacher/teacher_give_score.html',{'students':students})

def give_score(request):
	student_choice_id = request.GET.get('student_choice_id',None)
	print(student_choice_id)
	score = request.POST['score_{}'.format(student_choice_id)]
	print('score_{}'.format(student_choice_id))
	print(score)
	give_score = models.StudentChoice.objects.get(student_choice_id=student_choice_id)
	give_score.score = score
	give_score.save()
	students = models.StudentChoice.objects.filter(score__isnull=True)
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

def stu_job_certification(request):
	try:
		stu_id = request.session.get('stu_id')
		job_name = request.POST.get("job_name")
		days = request.POST.get("days")
		jobs = models.JobCertification(stu_id = stu_id,job_name = job_name,days=days,status = 0)
		jobs.save()
		return render(request,'student/stu_job_certification.html')
	except:
		return render(request,'student/stu_job_certification.html')

def job_review(request):
	job_id = request.GET.get('job_id')
	thisjob = models.JobCertification.objects.get(job_id = job_id)
	thisjob.status = 1
	thisjob.save()
	jobs = models.JobCertification.objects.all()
	return render(request,'instructor/instructor_job_review.html',{'jobs':jobs})

def instructor_job_review(request):
	jobs = models.JobCertification.objects.all()
	return render(request,'instructor/instructor_job_review.html',{'jobs':jobs})

def received_products(request):
	product_id = request.GET.get('product_id')
	myproduct = models.Orders.objects.get(product_id = product_id)
	myproduct.received = 1
	price = myproduct.price
	seller_id = myproduct.seller_id
	myproduct.save()
	stu_id = request.session.get('stu_id')
	moneychange = models.Student.objects.get(stu_id= seller_id)
	moneychange.money += price
	moneychange.save()
	products = models.Orders.objects.filter(buyer_id =stu_id)
	return render(request,'student/stu_cart.html',{'products':products})

def stu_cart(request):
	stu_id = request.session.get('stu_id')
	products = models.Orders.objects.filter(buyer_id =stu_id)
	return render(request,'student/stu_cart.html',{'products':products})