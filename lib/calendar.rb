module Calendar

  def leap_year?(year)

    mult4 =   (year % 4   == 0)
    mult100 = (year % 100 == 0)
    mult400 = (year % 400 == 0)

    mult4 && ((! mult100) || mult400)
  end


  def days_in_month(year, month)
    case month
      when 1;  31
      when 2;  leap_year?(year) ? 29 : 28
      when 3;  31
      when 4;  30
      when 5;  31
      when 6;  30
      when 7;  31
      when 8;  31
      when 9;  30
      when 10; 31
      when 11; 30
      when 12; 31
    end
  end

  def days_in_year(year)
    leap_year?(year) ? 366 : 365
  end


end