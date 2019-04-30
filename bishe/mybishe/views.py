from django.shortcuts import render,redirect
from mybishe import models
from django.db.models import F
import datetime
from django.db.models import Sum,Count,Max,Min,Avg
import inspect
import re
# Create your views here.
def stu_info(request):
	if request.method == 'GET':
		majors = models.Major.objects.all()
		educations = models.BorrowRule.objects.all()
		instructors = models.Instructor.objects.all()
		return render(request,'jwc/stu_info.html',{'majors' : majors,'educations': educations,'instructors': instructors})
	if request.method == 'POST':
		majors = models.Major.objects.all()
		educations = models.BorrowRule.objects.all()
		instructors = models.Instructor.objects.all()
		stu_pwd = request.POST.get('stu_pwd')
		stu_name = request.POST.get('stu_name')
		year = request.POST.get('year')
		major_id = request.POST.get('major_id')
		money = 100
		stu_edu = request.POST.get('stu_edu')
		instructor_id = request.POST.get('instructor_id')
		students = models.Student(stu_pwd = stu_pwd,stu_name=stu_name,stu_year=year,major_id=major_id,stu_edu=stu_edu,instructor_id=instructor_id,money = money)
		students.save()
		return render(request,'jwc/stu_info.html',{'majors' : majors,'educations': educations,'instructors': instructors})

def stu_login(request):
	if request.method == 'GET':
		return render(request, 'student/stu_login.html')
	if request.method == 'POST':
		user = models.Student.objects.get(stu_id = request.POST['stu_id'])
		request.session['stu_name'] = user.stu_name
		request.session['stu_id'] = user.stu_id
		return redirect('/stu_index/')



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
	borrow_order = models.BorrowOrder(stu_id = stu_id,book_id=book_id,startdate=now,supposedate = n_days,return_status = 0,price = price)
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
	now = datetime.datetime.now()
	borrow_order.return_status = 1
	borrow_order.actdate = datetime.datetime.now()
	if datetime.datetime.now() > borrow_order.supposedate:
		pen_money = (datetime.datetime.now() - borrow_order.supposedate).days
		borrow_id = borrow_order.borrow_id
		stu_id = request.session.get('stu_id')
		penatly = models.Penalty(borrow_id = borrow_id,pen_money = pen_money,stu_id = stu_id,pen_type="逾期",paid = 0, appeal = 0)
		penatly.save()
	else:
		pass
	borrow_order.save()
	orders = models.BorrowOrder.objects.filter(return_status = '0')
	return render(request,'jwc/library_return.html',{'orders':orders,'now':now})


def stu_sp_certification(request):
	if request.method =='GET':
		certifications = models.Rules.objects.all()
		return render(request,'student/stu_sp_certification.html',{'certifications':certifications})
	if request.method =='POST':
		rule_name = request.POST.get('rule_name')
		print(rule_name)
		stu_id = request.session.get('stu_id')
		comment = request.POST.get('comments')
		print(comment)
		getrule = models.Rules.objects.get(rule_name = rule_name)
		rule_id = getrule.rule_id
		score = getrule.score
		addorder = models.AddCreditOrder(stu_id = stu_id,rule_id = rule_id,rule_name = rule_name,score = score,status = 0,comment = comment)
		addorder.save()
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
		products = models.Products(pro_name = pro_name,price_org = price_org,price_cur = price_cur,seller_id = seller_id,location = location,status = status,paid =0)
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
	mybook.return_status = 1
	stu_id = mybook.stu_id
	students = models.Student.objects.get(stu_id = stu_id)
	price = mybook.price
	students.money = students.money - price
	penatly = models.Penalty(borrow_id = borrow_id,stu_id = stu_id, pen_money = price,pen_type = "丢书")
	mybook.save()
	penatly.save()
	students.save()
	books = models.BorrowOrder.objects.filter(stu_id = 1,return_status = 0)
	return render(request,'student/stu_book_lost.html',{'books':books})

def teacher_give_score(request):
	if request.method == 'GET':
		students = models.StudentChoice.objects.filter(score__isnull=True)
		return render(request,'teacher/teacher_give_score.html',{'students':students})
	if request.method =='POST':
		student_choice_id = request.POST.get('student_choice_id')
		print(student_choice_id)
		score = request.POST.get('score')
		print(score)
		addscore = models.StudentChoice.objects.get(student_choice_id=student_choice_id)
		addscore.score = score
		addscore.save()
		students = models.StudentChoice.objects.filter(score__isnull=True)
		return render(request,'teacher/teacher_give_score.html',{'students':students})

def stu_skills_order(request):
	courses = models.StudentChoice.objects.filter(score__gte=90, stu_id = request.session.get('stu_id'),status = 0)
	return render(request,'student/stu_skills_order.html',{'courses':courses})

def instructor_sp_confirm(request):
	rules = models.AddCreditOrder.objects.filter(status = 0)
	return render(request,'instructor/instructor_sp_confirm.html',{"rules":rules})

def add_review(request):
	add_id = request.GET.get('add_id')
	c_order = models.AddCreditOrder.objects.get(add_id=add_id)
	c_order.status = 1
	c_order.save()
	rules = models.AddCreditOrder.objects.filter(status = 0)
	return render(request,'instructor/instructor_sp_confirm.html',{"rules":rules})

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
	save_course = models.StudentChoice(teacher_choice_id= teacher_choice_id,stu_id = stu_id, course_id =course_id, status=0)
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

def stu_pay_penalty(request):
	stu_id = request.session.get('stu_id')
	penaltys = models.Penalty.objects.filter(paid = 0, appeal = 0, stu_id = stu_id)
	return render(request,'student/stu_pay_penalty.html',{'penaltys':penaltys})

def pay_penalty(request):
	stu_id = request.session.get('stu_id')
	stu_pen_id = request.GET.get('stu_pen_id')
	mypen = models.Penalty.objects.get(stu_pen_id=stu_pen_id)
	price = mypen.pen_money
	mypen.paid = 1
	mypen.save()
	moneylose = models.Student.objects.get(stu_id = stu_id)
	moneylose.money = moneylose.money-price
	moneylose.save()
	penaltys = models.Penalty.objects.filter(paid = 0, appeal = 0, stu_id = stu_id)
	return render(request,'student/stu_pay_penalty.html',{'penaltys':penaltys})	

def stu_course(request):
	stu_id = request.session.get('stu_id')
	courses = models.StudentChoice.objects.filter(stu_id = stu_id)
	return render(request,'student/stu_course.html',{'courses':courses})

def teacher_course(request):
	teacher_id = request.session.get('teacher_id')
	courses = models.TeacherChoice.objects.filter(teacher_id = teacher_id)
	return render(request,'teacher/teacher_course.html',{'courses':courses})

def stu_buyer_comment(request):
	stu_id =request.session.get('stu_id')
	if request.method == 'GET':
		buyers = models.Orders.objects.filter(buyer_comm__isnull=True,buyer_id = stu_id)
		return render(request,'student/stu_buyer_comment.html',{'buyers':buyers})
	if  request.method == 'POST':
		order_id = request.POST.get('order_id')
		score = request.POST.get('score')
		addscore = models.Orders.objects.get(order_id = order_id)
		addscore.buyer_comm = score
		addscore.save()
		buyers = models.Orders.objects.filter(buyer_comm__isnull=True,buyer_id = stu_id)
		return render(request,'student/stu_buyer_comment.html',{'buyers':buyers})

def stu_seller_comment(request):
	stu_id =request.session.get('stu_id')
	if request.method == 'GET':
		buyers = models.Orders.objects.filter(seller_comm__isnull=True,seller_id = stu_id)
		return render(request,'student/stu_seller_comment.html',{'buyers':buyers})
	if  request.method == 'POST':
		order_id = request.POST.get('order_id')
		score = request.POST.get('score')
		addscore = models.Orders.objects.get(order_id = order_id)
		addscore.seller_comm = score
		addscore.save()
		buyers = models.Orders.objects.filter(seller_comm__isnull=True,seller_id = stu_id)
		return render(request,'student/stu_seller_comment.html',{'buyers':buyers})

def pro_review(request):
	pro_id = request.GET.get('pro_id')
	changestatus = models.Products.objects.get(pro_id = pro_id)
	changestatus.status =1
	changestatus.save()
	products = models.Products.objects.filter(status = 0)
	return render(request,'instructor/instructor_pro_review.html',{'products':products})

def skills_order(request):
	student_choice_id = request.GET.get('student_choice_id')
	changestatus = models.StudentChoice.objects.get(student_choice_id=student_choice_id)
	changestatus.status = 1
	changestatus.save()
	score = 100
	year = 2019
	stu_id = request.session.get('stu_id')
	status = 0
	addcredit = models.Credit(stu_id = stu_id,year =year,score = score, status =status)
	addcredit.save()
	courses = models.StudentChoice.objects.filter(score__gte=90, stu_id = request.session.get('stu_id'),status = 0)
	return render(request,'student/stu_skills_order.html',{'courses':courses})

def teacher_skills_review(request):
	credits = models.Credit.objects.filter(status = 0)
	return render(request,'teacher/teacher_skills_review.html',{'credits':credits})

def skills_review(request):
	credit_id = request.GET.get('credit_id')
	changestatus = models.Credit.objects.get(credit_id = credit_id)
	changestatus.status = 1
	changestatus.save()
	credits = models.Credit.objects.filter(status = 0)
	return render(request,'teacher/teacher_skills_review.html',{'credits':credits})

def instructor_index(request):
	losts = models.BorrowOrder.objects.filter(return_status = 0)
	counts = 0
	for lost in losts:
		if (datetime.datetime.now()-lost.supposedate).days >180:
			lost.actdate = datetime.datetime.now()
			lost.return_status = 1
			price = lost.price
			borrow_id =lost.borrow_id
			stu_id = lost.stu_id
			addlost = model.Penalty(stu_id = stu_id,pen_money = price,type = '丢书')
			student = model.Student.objects.get(stu_id = stu_id)
			student.money -= price
			student.save()
			lost.save()
			addlost.save()
			counts = count+1
	message = "有{}个借阅被判定为自动丢书".format(counts)
	return render(request,'instructor/instructor_index.html',{'message':message})

def stu_appeal(request):
	if request.method == 'GET':
		teachers =models.Teacher.objects.all()
		appeals =models.Penalty.objects.filter(stu_id = request.session.get('stu_id'),paid =0)
		return render(request,'student/stu_appeal.html',{'teachers':teachers,'appeals':appeals})
	if request.method == 'POST':
		order_id = request.POST.get('order_id')
		teacher_id = request.POST.get('tea_id')
		addpen = models.PenAppeal(stu_pen_id = order_id,status = 0, teacher_id = teacher_id)
		changestatus = models.Penalty.objects.get(stu_pen_id = order_id)
		changestatus.appeal = 1
		changestatus.save()		
		addpen.save()
		teachers =models.Teacher.objects.all()
		appeals =models.Penalty.objects.filter(stu_id = request.session.get('stu_id'),paid =0)
		return render(request,'student/stu_appeal.html',{'teachers':teachers,'appeals':appeals})

def teacher_pen_review(request):
	pens = models.PenAppeal.objects.filter(teacher_id = request.session.get('teacher_id'),status =0)
	return render(request,'teacher/teacher_pen_review.html',{'pens':pens})

def pen_review(request):
	pen_id =request.GET.get('pen_id')
	changestatus = models.PenAppeal.objects.get(pen_appeal_id = pen_id)
	changestatus.status = 1
	changestatus.save()
	pens = models.PenAppeal.objects.filter(teacher_id = request.session.get('teacher_id'),status =0)
	return render(request,'teacher/teacher_pen_review.html',{'pens':pens})

def teacher_cheat(request):
	if request.method == 'GET':
		students = models.StudentChoice.objects.filter(score__isnull=True)
		return render(request,'teacher/teacher_cheat.html',{'students':students})
	if request.method == 'POST':
		student_choice_id = request.POST.get('student_choice_id')
		student =models.StudentChoice.objects.get(student_choice_id=student_choice_id)
		student.score =0
		stu_id = student.stu_id
		student.save()
		addcheat = models.Cheat(stu_id = stu_id,student_choice_id = student_choice_id)
		addcheat.save()
		students = models.StudentChoice.objects.filter(score__isnull=True)
		return render(request,'teacher/teacher_cheat.html',{'students':students})

def scholarship(request):
	cleartable = models.Scholarship.objects.all()
	cleartable.delete()
	students = models.Student.objects.all()
	stu_id_list = []
	scholarship_list=[]
	basic_money = 1000
	i = 0
	for student in students:
		stu_id_list.append(student.stu_id)
	print(stu_id_list)
	for stu_id in stu_id_list:
		find_student = models.StudentChoice.objects.filter(score__isnull=False,stu_id = stu_id).aggregate(Avg("score"))
		scholarship_list.append([stu_id,find_student['score__avg']])
	print(scholarship_list)
	new_scholarship_list=sorted(scholarship_list, key=lambda x:x[1], reverse = True )
	print(new_scholarship_list)
	for _list in new_scholarship_list:
		if i < 3:
			addscholarship = models.Scholarship(stu_id = _list[0],status = 0, money = basic_money)
			addscholarship.save()
			print(_list)
			print(basic_money)
			basic_money -= 300
			i +=1 
		else:
			break
	return render(request,'scholarship.html')


def stu_scholarship(request):
	scholarships = models.Scholarship.objects.filter(stu_id = request.session.get('stu_id'),status =0)
	return render(request,'student/stu_scholarship.html',{'scholarships':scholarships})

def sch_order(request):
	sch_id = request.GET.get('sch_id')
	mysch = models.Scholarship.objects.get(sch_id = sch_id)
	mysch.status = 1
	stu_id = mysch.stu_id
	money = mysch.money
	addmoney = models.Student.objects.get(stu_id = stu_id)
	addmoney.money += money
	addmoney.save()
	mysch.save()
	scholarships = models.Scholarship.objects.filter(stu_id = request.session.get('stu_id'),status =0)
	return render(request,'student/stu_scholarship.html',{'scholarships':scholarships})

#判断年级
def test_grade(year):
    if datetime.datetime.now().month in [1,2,3,4,5,6,7,8]:
        i = 1
    else:
        i = 0
    return (datetime.datetime.now().year-year)-i+1

def credit_score(request):
	cleartable = models.SepScore.objects.all()
	cleartable.delete()
	stu_scholarship = []
	stu_gpa = []
	stu_paper = []
	stu_job =[]
	stu_cheat = []
	stu_c =[]
	stu_credit=[]
	stu_penalty=[]
	stu_total_labor = []
	stu_total_debt =[]
	students = models.Student.objects.all()
	for student in students:
		stu_id = student.stu_id
		thisstu = models.Student.objects.get(stu_id = stu_id)
		grade = test_grade(int(thisstu.stu_year))
		scholarship = test_none(models.Scholarship.objects.filter(status =1, stu_id = stu_id).aggregate(Sum("money"))['money__sum'])
		stu_scholarship.append([stu_id,scholarship])
		gpa = test_none(models.StudentChoice.objects.filter(score__isnull=False,stu_id = stu_id).aggregate(Avg("score"))['score__avg'])
		stu_gpa.append([stu_id,gpa])
		paper = test_none(models.AddCreditOrder.objects.filter(status =1, stu_id = stu_id).aggregate(Sum("score"))['score__sum'])
		stu_paper.append([stu_id,paper])
		cheat = models.Cheat.objects.filter(stu_id = stu_id).count()		
		stu_cheat.append([stu_id,cheat])
		credit= models.Credit.objects.filter(stu_id = stu_id,status = 1).count()		
		stu_credit.append([stu_id,credit])
		job = test_none(models.JobCertification.objects.filter(stu_id = stu_id,status = 1).aggregate(Sum('days'))['days__sum'])	
		stu_job.append([stu_id,job])
		s_c = models.Orders.objects.filter(buyer_id = stu_id,seller_comm__isnull=False).aggregate(Avg('seller_comm'))['seller_comm__avg']		
		b_c = models.Orders.objects.filter(seller_id = stu_id,buyer_comm__isnull=False).aggregate(Avg('buyer_comm'))['buyer_comm__avg']
		s_c = test_none(s_c)
		b_c = test_none(b_c)
		stu_c.append([stu_id,s_c+b_c])
		penatly = test_none(models.Penalty.objects.filter(stu_id = stu_id,paid =1).aggregate(Sum('pen_money'))['pen_money__sum'])
		stu_penalty.append([stu_id,penatly])
	#print(stu_scholarship,stu_gpa,stu_paper,stu_job,stu_cheat,stu_c,stu_credit,stu_penalty,sep ='\n')
	stu_scholarship = sorted_rank(stu_scholarship)
	score_type = 'stu_scholarship'
	'''	savedata = models.SepScore(score_type = 'stu_scholarship',stu_id = stu_scholarship[0],score = stu_scholarship[1],rank = stu_scholarship[2])
	savedata.save()'''
	savedata(stu_scholarship,score_type)
	stu_gpa = sorted_rank(stu_gpa)
	savedata(stu_gpa,'stu_gpa')
	'''	savedata = models.SepScore(score_type = 'stu_gpa',stu_id = stu_gpa[0],score =stu_gpa[1],rank = stu_gpa[2])
	savedata.save()	'''
	stu_paper = sorted_rank(stu_paper)
	savedata(stu_paper,'stu_paper')
	'''	savedata = models.SepScore(score_type = 'stu_paper',stu_id = stu_paper[0],score = stu_paper[1],rank = stu_paper[2])
	savedata.save()	'''
	stu_job = sorted_rank(stu_job)
	savedata(stu_job,'stu_job')
	'''	savedata = models.SepScore(score_type = 'stu_job',stu_id = stu_job[0],score =stu_job[1],rank = stu_job[2])
	savedata.save()	'''
	stu_cheat = sorted_rank(stu_cheat)
	savedata(stu_cheat,'stu_cheat')
	'''	savedata = models.SepScore(score_type = 'stu_cheat',stu_id = stu_cheat[0],score = stu_cheat[1],rank = stu_cheat[2])
	savedata.save()	'''
	stu_c = sorted_rank(stu_c)
	savedata(stu_c,'stu_c')
	'''	savedata = models.SepScore(score_type = 'stu_c',stu_id = stu_c[0],score = stu_c[1],rank = stu_c[2])
	savedata.save()	'''
	stu_credit = sorted_rank(stu_credit)
	savedata(stu_credit,'stu_credit')
	'''	savedata = models.SepScore(score_type = 'stu_credit',stu_id = stu_credit[0],score =stu_credit[1],rank = stu_credit[2])
	savedata.save()	'''
	stu_penalty = sorted_rank(stu_penalty)
	savedata(stu_penalty,'stu_penalty')
	'''	savedata = models.SepScore(score_type = 'stu_penalty',stu_id = stu_penalty[0],score = stu_penalty[1],rank = stu_penalty[2])
	savedata.save()	'''
	print(stu_scholarship,stu_gpa,stu_paper,stu_job,stu_cheat,stu_c,stu_credit,stu_penalty,sep ='\n')
	return render(request,'credit_score.html')

def savedata(yourlist,score_type):
	for ylist in yourlist:
		savedata = models.SepScore(score_type =score_type ,stu_id = ylist[0],score =ylist[1],rank = ylist[2])
		savedata.save()	

def test_none(number):
	if number == None:
		number = 0
	else:
		number = number
	return number

def stu_index(request):
	stu_id = request.session.get('stu_id')
	student = models.Student.objects.get(stu_id = stu_id)
	money = student.money
	grade = test_grade(int(student.stu_year))
	name = student.stu_name
	scholarship = models.SepScore.objects.get(score_type='stu_scholarship',stu_id=stu_id)
	gpa = models.SepScore.objects.get(score_type = 'stu_gpa',stu_id = stu_id)
	paper = models.SepScore.objects.get(score_type = 'stu_paper',stu_id = stu_id)
	job =  models.SepScore.objects.get(score_type = 'stu_job',stu_id = stu_id)
	cheat = models.SepScore.objects.get(score_type = 'stu_cheat',stu_id = stu_id)
	c = models.SepScore.objects.get(score_type = 'stu_c',stu_id = stu_id)
	credit = models.SepScore.objects.get(score_type = 'stu_credit',stu_id = stu_id)
	penalty = models.SepScore.objects.get(score_type = 'stu_penalty',stu_id = stu_id)
	print(stu_id,money,grade,name)
	return render(request,'student/stu_index.html',{'grade':grade,'money':money,'name':name,'scholarship':scholarship,'gpa':gpa,'paper':paper,'job':job,'cheat':cheat,'c':c,'credit':credit,'penalty':penalty})

def sorted_rank(yourlist):
    newlist = sorted(yourlist,key = lambda x:x[1],reverse =True)
    for i in range(len(yourlist)):
        newlist[i].append(i+1)
    return newlist

def varname(p):
    for line in inspect.getframeinfo(inspect.currentframe().f_back)[3]:
        m = re.search(r'\bvarname\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*\)', line)
        if m:
            return m.group(1)

def other_index(request):
	students = models.Student.objects.all()
	score_list = []
	for student in students:
		stu_id = student.stu_id
		stu_name = student.stu_name
		stu_scholarship = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_scholarship').score
		stu_gpa = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_gpa').score
		stu_paper = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_paper').score
		stu_job = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_job').score
		stu_cheat = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_cheat').score
		stu_c = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_c').score
		stu_credit = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_credit').score
		stu_penalty = models.SepScore.objects.get(stu_id = stu_id,score_type = 'stu_penalty').score
		stu_score = stu_scholarship+stu_gpa+stu_paper+stu_job-stu_cheat+stu_c+stu_credit-stu_penalty
		score_list.append([stu_id,stu_name,stu_score])
	print(score_list)
	newlist = sorted(score_list,key = lambda x:x[2],reverse = True)
	for i in range(len(newlist)):
		newlist[i].append(i+1)
	print(newlist)
	return render(request,'other_index.html')

def save_score(data):
	for da in data:
		