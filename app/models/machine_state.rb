class MachineState

  STATES = ["planned-downtime", "unplanned-downtime", "producing"]
  
  def initialize(data)
    @data = data
  end

  def planned_downtime_percentage
    ((planned_downtime/total_time_running.to_f)*100).round(2)
  end

  def unplanned_downtime_percentage
    ((unplanned_downtime/total_time_running.to_f)*100).round(2)
  end

  def producing_percentage
    ((producing/total_time_running.to_f)*100).round(2)
  end

  private

  def total_time_running
    planned_downtime + producing + unplanned_downtime
  end

  #TODO: we  can do meta programing based on states instead of re-writing funtions
  def planned_downtime
    duration = 0
    @data.each do |a|
      if a["state"].eql?("planned-downtime")
        duration += a["duration"].to_i
      end
    end
    duration
  end

  def producing
    duration = 0
    @data.each do |a|
      if a["state"].eql?("producing")
        duration += a["duration"].to_i
      end
    end
    duration
  end
  
  def unplanned_downtime
    duration = 0
    @data.each do |a|
      if a["state"].eql?("unplanned-downtime")
        duration += a["duration"].to_i
      end
    end
    duration
  end
end
