class FormatExceptionDate
  include YYMMDD
  def initialize(inp)
    @date = inp.to_date
  end
  def to_s
    mm/dd/yyyy(@date)
  end
  def date
    @date
  end
end
