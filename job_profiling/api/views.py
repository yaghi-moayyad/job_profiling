from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from api.documents import EvaluationOutput
from api.serializers import EvaluationOutputSerializer
import random




@api_view(['GET'])
def info_list(request):
    """
    List all job info
    """
    
    results = EvaluationOutput.objects.all()[:10]
    serializer = EvaluationOutputSerializer(results, many=True)
    return Response(serializer.data)


@api_view(['GET','POST'])
def get_cluster(request):
    """
    List all job info
    """
    cl = random.randint(2, 3)
    if request.method == 'POST':
        return Response({'Cluster':cl})
        #serializer = dataSerializer(data=request.data)
        #if serializer.is_valid():
        #    serializer.save()
    elif request.method =='GET':
        return {'result':'no data provided'}


    
    results = {'Cluster':cl}
    serializer = EvaluationOutputSerializer(results)
    return Response(serializer.data)

@api_view(['GET'])
def fill_data(request):
    """
    read data from .dta files, writes into mongodb
    """
    result, count = EvaluationOutput.fill_data()
    return Response({'Result':int(result), 'records_inserted':count})