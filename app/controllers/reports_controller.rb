class ReportsController < ApplicationController
  def weekly_report
    @start = Date.today
    @end = 7.days.since(Date.today)
  end

  def process_report
    @start = params[:start]
    @end = params[:end]
    @exercises = Exercise.find(:all, :conditions => { :exercise_date => @start..@end })
    
    @total_count = @exercises.count

    @total_minutes = 0

    @exercises.each do |exercise|
      @total_minutes = @total_minutes + exercise.minutes
    end

    respond_to do |format|
      format.html # process_report.html.erb
      format.json { render json: @exercises }
    end
  end

  def person_report
  end

  def process_person_report
    @person = params[:person]
    @exercises = Exercise.where("person = ?", @person)
    @total_count = @exercises.count

    @total_minutes = 0

    @exercises.each do |exercise|
      @total_minutes = @total_minutes + exercise.minutes
    end

    respond_to do |format|
      format.html # process_report.html.erb
      format.json { render json: @exercises }
    end
  end
end