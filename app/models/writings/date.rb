module Writings

  class Date

    def initialize( year, month, day )
      @year  = year
      @month = month
      @day   = day
    end

    def to_s
      state = 0
      state += 1 if @year
      state += 2 if @month
      state += 4 if @day

      case state
      when 0; 'Date Unknown'
      when 1; "#{@year}"
      when 2; month_str
      when 3; month_str + ', ' + @year
      when 4; 'A day numbered: ' + @day
      when 5; "#{@year}"
      when 6; "#{month_str} #{@day}"
      when 7; "#{month_str} #{@day}, #{@year}"
      end

    end

    protected

    def month_str
      @@months = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec' ]
      @@months[ @month - 1 ]
    end


  end

end
