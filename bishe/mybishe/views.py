from django.shortcuts import render
from mybishe import models
# Create your views here.
def stu_info(request):
	stu_pwd = request.POST.get('stu_pwd')
	stu_name = request.POST.get('stu_name')
	amount = request.POST.get('amount')
	bed_id = request.POST.get('bed_id')
	dorm_id = request.POST.get('dorm_id')
	year = request.POST.get('year')
	money = 0
	major_id = request.POST.get('major_id')
	stu_edu = request.POST.get('stu_edu')
	return render(request,'jwc/stu_info.html')
