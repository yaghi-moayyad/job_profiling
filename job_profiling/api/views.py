from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import HttpRequest, JsonResponse
from api.documents import EvaluationOutput
from api.serializers import EvaluationOutputSerializer
import random
from joblib import load


features = ['EducationLevel_Bachelor or above', 'EducationLevel_Middle Diploma',
       'EducationLevel_Secondary or Below', 'employment_status_Daily worker',
       'employment_status_Housewife', 'employment_status_Informal worker',
       'employment_status_Self-employed', 'employment_status_Unemployed',
       'Governorate_Ajloun', 'Governorate_Al Aqaba', 'Governorate_Al Kirk',
       'Governorate_Al Mafraq', 'Governorate_Amman', 'Governorate_Balqa',
       'Governorate_Irbid', 'Governorate_Jarash', 'Governorate_Maadaba',
       'Governorate_Maan', 'Governorate_Tafileh', 'Governorate_Zarqa',
       'Experience', 'Age']

model = load('model.joblib')

@api_view(['GET'])
def info_list(request):
    """

    """
    
    results = EvaluationOutput.objects.all()[:10]
    serializer = EvaluationOutputSerializer(results, many=True)
    return Response(serializer.data)


@api_view(['GET','POST'])
def get_cluster(request):
    
    model_input = []
    if request.method == 'GET':
        data = request.GET
    else:
        data = request.POST
    
    
    for i in features:
        model_input.append(int(data.get(i)) or 0)
    

    
    res = model.predict([model_input])
    print('RES :',res[0])
    return JsonResponse({'cluster':str(res[0])}, safe=False)
        #serializer = dataSerializer(data=request.data)
        #if serializer.is_valid():
        #    serializer.save()



    
  

