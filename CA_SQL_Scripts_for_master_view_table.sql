drop view azick777_ca.tbl_view1;
-- Create view1 table for master table
CREATE VIEW azick777_ca.tbl_view1 AS
select 
leads.*,  
cf.slug as slugs, 
cf.name as questions,
 LEFT(cfv.value, 1) as answers

from azick777_ca.tblleads leads
join azick777_ca.tblcustomfieldsvalues cfv on cfv.relid= leads.id
join azick777_ca.tblcustomfields cf on cf.id = cfv.fieldid
 -- It filters only Patients at the awareness stage, new patients are not included in the master table.
where leads.status > 1;
-- -----------------------------------------------------------------------------------------------------------------------
-- Create view2 table for master table
drop view azick777_ca.tbl_view2;

CREATE VIEW azick777_ca.tbl_view2 AS
SELECT
  id, 
 MAX(IF(slugs = 'leads_drdxar1_respondents_who_have_had_a_doctor_diagnose_them_as_having_some_form_of_arthritis', answers, NULL)) AS _DRDXAR1,
MAX(IF(slugs = 'leads_length_of_time_since_last_routine_checkup_about_how_long_has_it_been_since_you_last_visited_a_doctor_for_a_routine_checkup_a_routine_checkup_is_', answers, NULL)) AS CHECKUP1,
MAX(IF(slugs = 'leads_general_health_what_would_you_say_that_in_general_your_health_is', answers, NULL)) AS GENHLTH,
MAX(IF(slugs = 'leads_asthma3_ever_told_you_had_asthma', answers, NULL)) AS ASTHMA3,
MAX(IF(slugs = 'leads_pneuvac3_a_pneumonia_shot_or_pneumococcal_vaccine_is_usually_given_only_once_or_twice_in_a_person_s_lifetime_and_is_different_from_the_flu_shot_', answers, NULL)) AS PNEUVAC3,
MAX(IF(slugs = 'leads_ever_told_blood_pressure_high_have_you_ever_been_told_by_a_doctor_nurse_or_other_health_professional_that_you_have_high_blood_pressure_if_yes_an', answers, NULL)) AS BPHIGH4,
MAX(IF(slugs = 'leads_ever_told_blood_cholesterol_high_have_you_ever_been_told_by_a_doctor_nurse_or_other_health_professional_that_your_blood_cholesterol_is_high', answers, NULL)) AS TOLDHI2,
MAX(IF(slugs = 'leads_ever_told_you_had_skin_cancer_ever_told_you_had_skin_cancer', answers, NULL)) AS CHCSCNCR,
MAX(IF(slugs = 'leads_pacat1_physical_activity_categories', answers, NULL)) AS _PACAT1,
MAX(IF(slugs = 'leads_addepev2_ever_told_you_have_a_depressive_disorder_including_depression_major_depression_dysthymia_or_minor_depression', answers, NULL)) AS ADDEPEV2,
MAX(IF(slugs = 'leads_chckidny_ever_told_you_have_kidney_disease_do_not_include_kidney_stones_bladder_infection_or_incontinence_incontinence_is_not_being_able_to_cont', answers, NULL)) AS CHCKIDNY,
MAX(IF(slugs = 'leads_sex_indicate_sex_of_respondent', answers, NULL)) AS SEX,
MAX(IF(slugs = 'leads_ageg5yr_fourteen_level_age_category', answers, NULL)) AS _AGEG5YR,
MAX(IF(slugs = 'leads_marital_are_you_marital_status', answers, NULL)) AS MARITAL,
MAX(IF(slugs = 'leads_educa_what_is_the_highest_grade_or_year_of_school_you_completed', answers, NULL)) AS EDUCA,
MAX(IF(slugs = 'leads_renthom1_do_you_own_or_rent_your_home_home_is_defined_as_the_place_where_you_live_most_of_the_time_the_majority_of_the_year', answers, NULL)) AS RENTHOM1,
MAX(IF(slugs = 'leads_employ1_are_you_currently', answers, NULL)) AS EMPLOY1,
MAX(IF(slugs = 'leads_income2_is_your_annual_household_income_from_all_sources_if_respondent_refuses_at_any_income_level_code_refused', answers, NULL)) AS INCOME2,
MAX(IF(slugs = 'leads_decide_because_of_a_physical_mental_or_emotional_condition_do_you_have_serious_difficulty_concentrating_remembering_or_making_decisions', answers, NULL)) AS DECIDE,
MAX(IF(slugs = 'leads_smokday2_do_you_now_smoke_cigarettes_every_day_some_days_or_not_at_all', answers, NULL)) AS SMOKDAY2,
MAX(IF(slugs = 'leads_usenow3_do_you_currently_use_chewing_tobacco_snuff_or_snus_every_day_some_days_or_not_at_all_snus_swedish_for_snuff_is_a_moist_smokeless_tobacco', answers, NULL)) AS USENOW3,
MAX(IF(slugs = 'leads_ecignow_do_you_now_use_e_cigarettes_or_other_electronic_vaping_products_every_day_some_days_or_not_at_all', answers, NULL)) AS ECIGNOW,
MAX(IF(slugs = 'leads_exerany2_during_the_past_month_other_than_your_regular_job_did_you_participate_in_any_physical_activities_or_exercises_such_as_running_calisthen', answers, NULL)) AS EXERANY2,
MAX(IF(slugs = 'leads_copdcogh_during_the_past_3_months_did_you_have_a_cough_on_most_days', answers, NULL)) AS COPDCOGH,
MAX(IF(slugs = 'leads_copdbrth_do_you_have_shortness_of_breath_either_when_hurrying_on_level_ground_or_when_walking_up_a_slight_hill_or_stairs', answers, NULL)) AS COPDBRTH,
MAX(IF(slugs = 'leads_drnkany5_adults_who_reported_having_had_at_least_one_drink_of_alcohol_in_the_past_30_days', answers, NULL)) AS DRNKANY5,
MAX(IF(slugs = 'leads_lcsctscn_in_the_last_12_months_did_you_have_a_ct_or_cat_scan', answers, NULL)) AS LCSCTSCN,
MAX(IF(slugs = 'leads_hlthpln1_do_you_have_any_kind_of_health_care_coverage_including_health_insurance_prepaid_plans_such_as_hmos_or_government_plans_such_as_medicare', answers, NULL)) AS HLTHPLN1,
MAX(IF(slugs = 'leads_rfchol1_adults_who_have_had_their_cholesterol_checked_and_have_been_told_by_a_doctor_nurse_or_other_health_professional_that_it_was_high', answers, NULL)) AS _RFCHOL1,
MAX(IF(slugs = 'leads_ecigsts_four_level_e_cigarette_smoker_status_everyday_e_cigarette_user_someday_e_cigarette_user_former_e_cigarette_user_non_e_cigarette_user', answers, NULL)) AS _ECIGSTS,
MAX(IF(slugs = 'leads_diabete3_ever_told_you_have_diabetes', answers, NULL)) AS DIABETE3,
MAX(IF(slugs = 'leads_frtlt1a_consume_fruit_1_or_more_times_per_day', answers, NULL)) AS _FRTLT1A,
MAX(IF(slugs = 'leads_lmtjoin3_are_you_now_limited_in_any_way_in_any_of_your_usual_activities_because_of_arthritis_or_joint_symptoms', answers, NULL)) AS LMTJOIN3,
MAX(IF(slugs = 'leads_veglt1a_consume_vegetables_1_or_more_times_per_day', answers, NULL)) AS _VEGLT1A,
MAX(IF(slugs = 'leads_raceg21_white_non_hispanic_race_group', answers, NULL)) AS _RACE,
MAX(IF(slugs = 'leads_copdbtst_have_you_ever_been_given_a_breathing_test_to_diagnose_breathing_problems', answers, NULL)) AS COPDBTST,
MAX(IF(slugs = 'leads_copdflem_during_the_past_3_months_did_you_cough_up_phlegm_flem_or_mucus_on_most_days', answers, NULL)) AS COPDFLEM,
MAX(IF(slugs = 'leads_cvdstrk3_ever_told_you_had_a_stroke', answers, NULL)) AS CVDSTRK3,
MAX(IF(slugs = 'leads_diffalon_because_of_a_physical_mental_or_emotional_condition_do_you_have_difficulty_doing_errands_alone_such_as_visiting_a_doctor_s_office_or_sh', answers, NULL)) AS DIFFALON,
MAX(IF(slugs = 'leads_eyeexam_when_was_the_last_time_you_had_an_eye_exam_in_which_the_pupils_were_dilated_this_would_have_made_you_temporarily_sensitive_to_bright_lig', answers, NULL)) AS EYEEXAM,
MAX(IF(slugs = 'leads_marijana_during_the_past_30_days_on_how_many_days_did_you_use_marijuana_or_hashish', answers, NULL)) AS MARIJANA,
MAX(IF(slugs = 'leads_lmtscl1_limited_social_activities', answers, NULL)) AS _LMTSCL1,
MAX(IF(slugs = 'leads_lmtwrk1_limited_social_activities', answers, NULL)) AS _LMTWRK1,
MAX(IF(slugs = 'leads_bmi5cat_four_categories_of_body_mass_index_bmi', answers, NULL)) AS _BMI5CAT,
MAX(IF(slugs = 'leads_pdiabtst_have_you_had_a_test_for_high_blood_sugar_or_diabetes_within_the_past_three_years', answers, NULL)) AS PDIABTST

FROM
  azick777_ca.tbl_view1

GROUP BY
  id ;
-- -----------------------------------------------------------------------------------------------------------------------
-- Create Master view table with question columns
drop view azick777_ca.tbl_master;
CREATE VIEW azick777_ca.tbl_master AS
Select v1.name, v1.title, v1.company, v1.description, v1.country, v1.zip, v1.city, v1.address, v1.status, v1.email, v1.website, v1.phonenumber,
v2.*, lr.Predicted_value, lr.Yes_2, lr.No_1
from azick777_ca.tbl_view1 v1
join azick777_ca.tbl_view2 v2 using(id)
join azick777_ca.logistic_Reg lr using(id)
group by v1.id;
-- ---------------------------------------
drop view azick777_ca.tbl_ind_view1;
-- Create view1 table for master table
CREATE VIEW azick777_ca.tbl_ind_view1 AS
select 
leads.*,  
cf.slug as slugs, 
cf.name as questions,
 right(cfv.value, char_length(cfv.value) -2) as answers

from azick777_ca.tblleads leads
join azick777_ca.tblcustomfieldsvalues cfv on cfv.relid= leads.id
join azick777_ca.tblcustomfields cf on cf.id = cfv.fieldid
 -- It filters only Patients at the awareness stage, new patients are not included in the master table.
where leads.status > 1;

-- ----------------------------------------------
drop view azick777_ca.tbl_ind_view2;

CREATE VIEW azick777_ca.tbl_ind_view2 AS
SELECT
  id, 
MAX(IF(slugs = 'leads_general_health_what_would_you_say_that_in_general_your_health_is', answers, NULL)) AS GENHLTH,
MAX(IF(slugs = 'leads_ever_told_blood_pressure_high_have_you_ever_been_told_by_a_doctor_nurse_or_other_health_professional_that_you_have_high_blood_pressure_if_yes_an', answers, NULL)) AS BPHIGH4,
MAX(IF(slugs = 'leads_pacat1_physical_activity_categories', answers, NULL)) AS _PACAT1,
MAX(IF(slugs = 'leads_sex_indicate_sex_of_respondent', answers, NULL)) AS SEX,
MAX(IF(slugs = 'leads_ageg5yr_fourteen_level_age_category', answers, NULL)) AS _AGEG5YR,
MAX(IF(slugs = 'leads_educa_what_is_the_highest_grade_or_year_of_school_you_completed', answers, NULL)) AS EDUCA,
MAX(IF(slugs = 'leads_smokday2_do_you_now_smoke_cigarettes_every_day_some_days_or_not_at_all', answers, NULL)) AS SMOKDAY2,
MAX(IF(slugs = 'leads_rfchol1_adults_who_have_had_their_cholesterol_checked_and_have_been_told_by_a_doctor_nurse_or_other_health_professional_that_it_was_high', answers, NULL)) AS _RFCHOL1,
MAX(IF(slugs = 'leads_frtlt1a_consume_fruit_1_or_more_times_per_day', answers, NULL)) AS _FRTLT1A,
MAX(IF(slugs = 'leads_raceg21_white_non_hispanic_race_group', answers, NULL)) AS _RACEG21,
MAX(IF(slugs = 'leads_marijana_during_the_past_30_days_on_how_many_days_did_you_use_marijuana_or_hashish', answers, NULL)) AS MARIJANA,
MAX(IF(slugs = 'leads_bmi5cat_four_categories_of_body_mass_index_bmi', answers, NULL)) AS _BMI5CAT

FROM
  azick777_ca.tbl_ind_view1

GROUP BY
  id ;
  -- ------------------------
  
  drop view azick777_ca.tbl_indicator;
CREATE VIEW azick777_ca.tbl_indicator AS
Select v1.name,  v1.country, v1.zip, v1.city, v1.address, v1.status,
v2.*, lr.Yes_2, lr.No_1, 
CASE
  WHEN
    lr.Predicted_value = '1'
      THEN
        'No'
  WHEN
    lr.Predicted_value = '2'
      THEN
        'Yes'
END AS Predicted_value
from azick777_ca.tbl_ind_view1 v1
join azick777_ca.tbl_ind_view2 v2 using(id)
join azick777_ca.logistic_Reg lr using(id)
group by v1.id;