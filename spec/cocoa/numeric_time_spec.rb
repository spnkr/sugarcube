describe 'Numeric - Time methods' do

  it "should have a #millisecond(s) method" do
    0.milliseconds.should == 0
    500.millisecond.should == 0.5
    1000.milliseconds.should == 1
    2000.milliseconds.should == 2.0
  end

  it "should have an #in_milliseconds method" do
    0.milliseconds.in_milliseconds.should == 0
    500.millisecond.in_milliseconds.should == 500
    2000.milliseconds.in_milliseconds.should == 2000
  end

  it "should have an #per_millisecond method" do
    0.milliseconds.per_millisecond.should == 0
    500.millisecond.per_millisecond.should == 500
    2000.milliseconds.per_millisecond.should == 2000
  end

  it "should have a #second(s) method" do
    0.seconds.should == 0
    1.second.should == 1
    2.seconds.should == 2
  end

  it "should have an #in_seconds method" do
    0.seconds.in_seconds.should == 0
    1.second.in_seconds.should == 1
    2.seconds.in_seconds.should == 2
  end

  it "should have an #per_second method" do
    0.seconds.per_second.should == 0
    1.second.per_second.should == 1
    2.seconds.per_second.should == 2
  end

  it "should have a #minute(s) method" do
    0.minutes.should == 0
    1.minute.should == 60.seconds
    2.minutes.should == 120.seconds
  end

  it "should have an #in_minutes method" do
    0.minutes.in_minutes.should == 0
    1.minute.in_minutes.should == 1
    2.minutes.in_minutes.should == 2
  end

  it "should have an #per_minute method" do
    0.minutes.per_minute.should == 0
    1.minute.per_minute.should == 1
    2.minutes.per_minute.should == 2
  end

  it "should have a #hour(s) method" do
    0.hours.should == 0
    1.hour.should == 60.minutes
    2.hours.should == 120.minutes
  end

  it "should have an #in_hours method" do
    0.hours.in_hours.should == 0
    1.hour.in_hours.should == 1
    2.hours.in_hours.should == 2
  end

  it "should have an #per_hour method" do
    0.hours.per_hour.should == 0
    1.hour.per_hour.should == 1
    2.hours.per_hour.should == 2
  end

  it "should have a #day(s) method" do
    0.days.should == 0
    1.day.should == 24.hours
    2.days.should == 48.hour
  end

  it "should have an #in_days method" do
    0.days.in_days.should == 0
    1.day.in_days.should == 1
    2.days.in_days.should == 2
  end

  it "should have an #per_day method" do
    0.days.per_day.should == 0
    1.day.per_day.should == 1
    2.days.per_day.should == 2
  end

  it "should have a #week(s) method" do
    0.weeks.should == 0
    1.week.should == 7.days
    2.weeks.should == 14.days
  end

  it "should have an #in_weeks method" do
    0.weeks.in_weeks.should == 0
    1.week.in_weeks.should == 1
    2.weeks.in_weeks.should == 2
  end

  it "should have an #per_week method" do
    0.weeks.per_week.should == 0
    1.week.per_week.should == 1
    2.weeks.per_week.should == 2
  end

  it "should have a #month(s) method" do
    0.months.should == 0
    1.month.should == 30.416.days
    2.months.should == 60.832.days
  end

  it "should have an #in_months method" do
    0.months.in_months.should == 0
    1.month.in_months.should == 1
    2.months.in_months.should == 2
  end

  it "should have an #per_month method" do
    0.months.per_month.should == 0
    1.month.per_month.should == 1
    2.months.per_month.should == 2
  end

  it "should have a #year(s) method" do
    0.years.should == 0
    1.year.should == 365.25.days
    2.years.should == 730.5.days
  end

  it "should have an #in_years method" do
    0.years.in_years.should == 0
    1.year.in_years.should == 1
    2.years.in_years.should == 2
  end

  it "should have an #per_year method" do
    0.years.per_year.should == 0
    1.year.per_year.should == 1
    2.years.per_year.should == 2
  end

end
