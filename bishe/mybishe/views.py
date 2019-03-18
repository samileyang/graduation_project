from django.shortcuts import render
from mybishe import models
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
	money = 0
	major_id = request.POST.get('major_id')
	stu_edu = request.POST.get('stu_edu')
	instructor_id = request.POST.get('instructor_id')
	try:
		dorm = models.Dorm.objects.get(bed_id=bed_id)
		students = models.Student(stu_pwd = stu_pwd,stu_name=stu_name,stu_year=year,major=major_id,stu_edu=stu_edu,instructor_id=instructor_id,dorm_id=dorm_id,bed_id=bed_id,money = money)
		students.save()
		dorm.status = 1
		dorm.save()
	except:
		pass
	return render(request,'jwc/stu_info.html',{'dorms': dorms,'majors' : majors,'educations': educations,'instructors': instructors})

def stu_login(request):
	stu_id = request.POST.get('stu_id')
	stu_pwd = request.POST.get('stu_pwd')
	return render(request,'student/stu_login.html')

def jwc_index(request):
	return render(request,'jwc/jwc_index.html')

def stu_index(request):
	return render(request,'student/stu_index.html')

def stu_library_borrow(request):
	borrows = models.Borrow.objects.filter(status ='0')
	return render(request,'student/stu_library_borrow.html',{'borrows':borrows})

def library_return(request):
	orders = models.BorrowOrder.objects.all()
	return render(request,'jwc/library_return.html',{'orders':orders})

def stu_judge(request):
	dorms = models.Student.objects.filter(dorm_id=1)
	try:
		stu_id = request.POST.get('stu_id')
		score = request.POST.get('score')
	except:
		pass
	return render(request,'student/stu_judge.html',{'dorms':dorms})

def stu_sp_certification(request):
	certifications = models.Rules.objects.all()
	return render(request,'student/stu_sp_certification.html',{'certifications':certifications})

def stu_products(request):
	try:
		pro_name = request.POST.get('pro_name')
		price_org = request.POST.get('price_org')
		price_cur = request.POST.get('price_cur')
		location = request.POST.get('location')
	except:
		pass
	return render(request,'student/stu_products.html')

def instructor_pro_review(request):
	products = models.Products.objects.filter(status=0)
	return render(request,'instructor/instructor_pro_review.html',{'products':products})

def stu_pro_purchase(request):
	products = models.Products.objects.filter(status=1)
	return render(request,'student/stu_pro_purchase.html',{'products':products})