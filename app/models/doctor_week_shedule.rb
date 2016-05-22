class DoctorWeekShedule < ActiveRecord::Base

  belongs_to :doctor

  def self.get_number_of_day(day_name)
    number_day = 0
    if day_name == 'Пн'
      number_day = 1
    elsif day_name == 'Вт'
      number_day = 2
    elsif day_name == 'Ср'
      number_day = 3
    elsif day_name == 'Чт'
      number_day = 4
    elsif day_name == 'Пт'
      number_day = 5
    end
    number_day
  end

  def self.get_today_timetable(doctor_shedules)
    today = Date.today

    doctor_shedules.each do |doctor_shedule|
      if get_number_of_day(doctor_shedule.weekday) == today.wday
        return doctor_shedule
      end
    end

    return nil
  end

end
