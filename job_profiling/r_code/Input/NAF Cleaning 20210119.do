use "C:\Users\User\Desktop\Jordan\UNEP\Unemployment-Profile\Input\NAF SSC_merged.dta", clear


collapse (last) informality employment_status NAF_member NAF_SSC_merge first_ind last_ind poverty_score start_date end_date job_search_start unempl_spell raw_exp Experience_NAF RegistrationdateintoNEES rep_job wage wage_adj econ_activity_tr reason_suspension_tr Governorate Name_tr Disabled_tr EducationalAttainment Head_Of_Family_National_Number Family_Member_Birth_Date no_member_HH head_of_HH unemployed_HH Family_Member_Sex IS_Alive Gender Gov_NAF Employment_Status_Name_tr Educ_NAF Education_Enrolled_Type_Name_tr Disability_NAF School_Type_Name_tr Profession_Type_Sector_Name_tr Profession_Type_Name_tr Desired_Professional_Training_tr Industry_industry_NAF Industry_occupation_NAF GOV_Name Head_Of_Family_Name Family_Member_Name Education_Level_Name Employment_Status_Name Profession_Type_Sector_Name Profession_Type_Name Desired_Professional_Training Type_of_Technical_Training_Desc Other_Desired_Profession Other_Profession Education_Enrolled_Type_Name School_Type_Name Health_Condition_Name company_name ind_name econ_activity reason_suspension suspension_code المحافظه JobSeekers_DateOfBirth Disabled Disabilities_Name_Ar Name رقمالخلوي المؤهلالعلمي التخصص الوظيفةالمطلوبة الحالةبالضمانحتى1792020 اسمالشركةبالضمان تاريخالسريان تاريخالايقاف الراتب ApplicationPosts_HireDate Employers_Name EmployersClassifications_Name Governorates_Name_AR Disabilities_type Telephonenumber JobTitles_Name_AR hiring_frequency الحالةبالضمانالاجتماعيحتى17 trained not_hiredMOL_trained matched_hiredMOL hired_MOL_office _merge_with_mol PS2 _merge_with_poverty year date inflationrate merge_inflation infl_calc temp Age_NAF FirstJob_NAF, by(Request_ID NationalID_Number)

*Create Household types and representatives
gen InformalMember=0
replace InformalMember=1 if employment_status=="Daily worker"|employment_status=="Informal worker"|employment_status=="Self-employed"|employment_status==""|employment_status=="Housewife"
gen FormalMember=0
replace FormalMember=1 if employment_status=="Formal worker"
gen WorkingMember=0
replace WorkingMember=1 if InformalMember==1|FormalMember==1
gen WorkableMember=0
replace WorkableMember=1 if employment_status=="Unemployed"|InformalMember==1|FormalMember==1

egen InformalFamily=max(InformalMember), by(Request_ID)
egen FormalFamily=max(FormalMember), by(Request_ID)

gen UnemployedFamily=1
replace UnemployedFamily=0 if InformalFamily==1|FormalFamily==1 

gen FormallyUnemployedFamily=1
replace FormallyUnemployedFamily=0 if FormalFamily==1 

*Selecting a representative
drop temp
gen temp=Age_NAF
replace temp=temp+1000 if head_of_HH==1
sort temp
keep if WorkableMember==1
drop if Age_NAF>65 | Age_NAF<15

collapse (last) NationalID_Number informality employment_status NAF_member NAF_SSC_merge first_ind last_ind poverty_score start_date end_date job_search_start unempl_spell raw_exp Experience_NAF RegistrationdateintoNEES rep_job wage wage_adj econ_activity_tr reason_suspension_tr Governorate Name_tr Disabled_tr EducationalAttainment Head_Of_Family_National_Number Family_Member_Birth_Date no_member_HH head_of_HH unemployed_HH Family_Member_Sex IS_Alive Gender Gov_NAF Employment_Status_Name_tr Educ_NAF Education_Enrolled_Type_Name_tr Disability_NAF School_Type_Name_tr Profession_Type_Sector_Name_tr Profession_Type_Name_tr Desired_Professional_Training_tr Industry_industry_NAF Industry_occupation_NAF GOV_Name Head_Of_Family_Name Family_Member_Name Education_Level_Name Employment_Status_Name Profession_Type_Sector_Name Profession_Type_Name Desired_Professional_Training Type_of_Technical_Training_Desc Other_Desired_Profession Other_Profession Education_Enrolled_Type_Name School_Type_Name Health_Condition_Name company_name ind_name econ_activity reason_suspension suspension_code المحافظه JobSeekers_DateOfBirth Disabled Disabilities_Name_Ar Name رقمالخلوي المؤهلالعلمي التخصص الوظيفةالمطلوبة الحالةبالضمانحتى1792020 اسمالشركةبالضمان تاريخالسريان تاريخالايقاف الراتب ApplicationPosts_HireDate Employers_Name EmployersClassifications_Name Governorates_Name_AR Disabilities_type Telephonenumber JobTitles_Name_AR hiring_frequency الحالةبالضمانالاجتماعيحتى17 trained not_hiredMOL_trained matched_hiredMOL hired_MOL_office _merge_with_mol PS2 _merge_with_poverty year date inflationrate merge_inflation infl_calc Age_NAF FirstJob_NAF InformalMember FormalMember WorkingMember WorkableMember InformalFamily FormalFamily UnemployedFamily FormallyUnemployedFamily, by(Request_ID)

save "C:\Users\User\Desktop\Jordan\UNEP\Unemployment-Profile\Input\NAF Clean Set.dta", replace


**Urgent NAF
use "C:\Users\User\Desktop\Jordan\UNEP\Unemployment-Profile\Input\NAF SSC_merged.dta", clear


collapse (last) informality employment_status NAF_member NAF_SSC_merge first_ind last_ind poverty_score start_date end_date job_search_start unempl_spell raw_exp Experience_NAF RegistrationdateintoNEES rep_job wage wage_adj econ_activity_tr reason_suspension_tr Governorate Name_tr Disabled_tr EducationalAttainment Head_Of_Family_National_Number Family_Member_Birth_Date no_member_HH head_of_HH unemployed_HH Family_Member_Sex IS_Alive Gender Gov_NAF Employment_Status_Name_tr Educ_NAF Education_Enrolled_Type_Name_tr Disability_NAF School_Type_Name_tr Profession_Type_Sector_Name_tr Profession_Type_Name_tr Desired_Professional_Training_tr Industry_industry_NAF Industry_occupation_NAF GOV_Name Head_Of_Family_Name Family_Member_Name Education_Level_Name Employment_Status_Name Profession_Type_Sector_Name Profession_Type_Name Desired_Professional_Training Type_of_Technical_Training_Desc Other_Desired_Profession Other_Profession Education_Enrolled_Type_Name School_Type_Name Health_Condition_Name company_name ind_name econ_activity reason_suspension suspension_code المحافظه JobSeekers_DateOfBirth Disabled Disabilities_Name_Ar Name رقمالخلوي المؤهلالعلمي التخصص الوظيفةالمطلوبة الحالةبالضمانحتى1792020 اسمالشركةبالضمان تاريخالسريان تاريخالايقاف الراتب ApplicationPosts_HireDate Employers_Name EmployersClassifications_Name Governorates_Name_AR Disabilities_type Telephonenumber JobTitles_Name_AR hiring_frequency الحالةبالضمانالاجتماعيحتى17 trained not_hiredMOL_trained matched_hiredMOL hired_MOL_office _merge_with_mol PS2 _merge_with_poverty year date inflationrate merge_inflation infl_calc temp Age_NAF FirstJob_NAF, by(Request_ID NationalID_Number)

*Create Household types and representatives
gen InformalMember=0
replace InformalMember=1 if employment_status=="Daily worker"|employment_status=="Informal worker"|employment_status=="Self-employed"|employment_status==""|employment_status=="Housewife"
gen FormalMember=0
replace FormalMember=1 if employment_status=="Formal worker"
gen WorkingMember=0
replace WorkingMember=1 if InformalMember==1|FormalMember==1
gen WorkableMember=0
replace WorkableMember=1 if employment_status=="Unemployed"|InformalMember==1|FormalMember==1

egen InformalFamily=max(InformalMember), by(Request_ID)
egen FormalFamily=max(FormalMember), by(Request_ID)

gen UnemployedFamily=1
replace UnemployedFamily=0 if InformalFamily==1|FormalFamily==1 

gen FormallyUnemployedFamily=1
replace FormallyUnemployedFamily=0 if FormalFamily==1 



*Keep high education levels
keep if Educ_NAF=="PhD"| Educ_NAF=="Masters"| Educ_NAF=="Bachelor"| Educ_NAF=="Middle Diploma"
keep if Age_NAF>=20 & Age_NAF<=40
keep if WorkableMember==1
drop if employment_status=="Formal worker"

save "C:\Users\User\Desktop\Jordan\UNEP\Unemployment-Profile\Input\NAF Beneficiaries Clean Set.dta", replace
