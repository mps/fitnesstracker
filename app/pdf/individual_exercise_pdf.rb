class IndividualExercisePdf < Prawn::Document
	def initialize(exercises)
		super(top_margin: 70)
		@exercises = exercises
		@minutes = calculate_minutes(@exercises)
		person
		line_items
		totals
	end

	def calculate_minutes(exercises)
		minutes = 0
		exercises.each { |e| minutes += e.minutes }
		minutes
	end

	def person
		text "#{@exercises.first.person}", size: 30, style: :bold
	end

	def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(0..1).align = :right
      row(0).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [["Date", "Minutes"]] +
    @exercises.map do |exercise|
      [exercise.exercise_date.strftime("%b %d"), exercise.minutes]
    end
  end

  def totals
    move_down 15
    text "Total Exericse: #{@minutes} Minutes", size: 16, style: :bold
  end
end