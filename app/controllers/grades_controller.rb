class GradesController < ApplicationController

  def create
    @school = School.find(params[:school_id])
    @grade = @school.grades.create(grade_params)
	
	if @grade.save
		redirect_to school_path(@school)
	else
		render 'schools/edit'
	end
	
  end
  
  def destroy
    @school = School.find(params[:school_id])
    @grade = @school.grades.find(params[:id])
    @grade.destroy
    redirect_to school_path(@school)
  end
 
  private
    def grade_params
      params.require(:grade).permit(:subject, :grade, :average_mark)
    end
end
