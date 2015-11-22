class SurveysController < ApplicationController
  def create
    @school = School.find(params[:school_id])
	@survey = @school.surveys.create(survey_params)
	
	if @survey.save
		redirect_to school_path(@school)
	else
		render 'schools/edit'
	end
  end
  
  private
    def survey_params
	  params.require(:survey).permit(:school_year, :question, :grade_group, :non_excluded_responses, :many_or_all_responses, :many_or_all_pct, :at_no_time_responses, :at_no_time_pct, :few_times_responses, :few_times_pct, :some_times_responses, :some_times_pct)
    end
end