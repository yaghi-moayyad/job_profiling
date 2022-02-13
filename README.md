# job_profiling

an API to server a machine learning model

end points : 


1- /cluster [POST]: returns a cluster based on provided info :

                inputs :  
                
                
                ['EducationLevel_Bachelor or above', 'EducationLevel_Middle Diploma',
                'EducationLevel_Secondary or Below', 'employment_status_Daily worker',
                'employment_status_Housewife', 'employment_status_Informal worker',
                'employment_status_Self-employed', 'employment_status_Unemployed',
                'Governorate_Ajloun', 'Governorate_Al Aqaba', 'Governorate_Al Kirk',
                'Governorate_Al Mafraq', 'Governorate_Amman', 'Governorate_Balqa',
                'Governorate_Irbid', 'Governorate_Jarash', 'Governorate_Maadaba',
               'Governorate_Maan', 'Governorate_Tafileh', 'Governorate_Zarqa','Disability_No Disability',
                  'Disability_With disability','Experience', 'Age'],
                
                
                
                  example input: 
                {
                'EducationLevel_Bachelor or above':1, 
                'employment_status_Daily worker':1,
                'Governorate_Ajloun':1
                'Experience':12,
                'Disability_No Disability':1,
                'Age':28 
                }
                
                
                note that you dont have to provde all columns data, just the positive values.

2- /migrate [POST]: returns an image.
          example input: 
                {
                'gender':'F',
                'Disability':1,
                'Governorate':'Amman'
                }
                
                
               
                
                
                
