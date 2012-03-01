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

    if params[:csv] != nil
      send_data(@exercises.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => "weekly.csv")
      return
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

    if params[:csv] != nil
      filename = @person + ".csv"
      send_data(@exercises.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
      return
    end

    respond_to do |format|
      format.html # process_report.html.erb
      format.json { render json: @exercises }
      format.csv { send_data(@exercises.to_csv) }
    end
  end

  def individual_report
    @exercises = Exercise.all.group_by { |e| e.person }
    @total_minutes = 0.0

    Exercise.all.each do |exercise|
      @total_minutes = @total_minutes + exercise.minutes
    end

  end
end