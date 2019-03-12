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
		dorm = models.Dorm.objects.get(bed_id = bed_id)
		students = models.Student(stu_pwd = stu_pwd,stu_name=stu_name,stu_year=year,major=major_id,stu_edu=stu_edu,instructor_id=instructor_id,dorm_id=dorm_id,bed_id=bed_id,money = money)
		students.save()
		dorm.status = 1
		dorm.save()
	except:
		pass
	return render(request,'jwc/stu_info.html',{'dorms': dorms,'majors' : majors,'educations': educations,'instructors': instructors})
