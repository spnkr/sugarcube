class NSString

  # checks ISO8601 formats *before* falling back on natural language detection
  def nsdate
    SugarCube::DateParser.iso8601(self) || SugarCube::DateParser.parse_date(self)
  end

  def nstimezone
    case self
    when /([+-]?\d{4})/
      sec = $1[-4,2].to_i * 3600
      NSTimeZone.timeZoneForSecondsFromGMT(sec)
    when /(GMT|UTC)([+-]\d{1,2})?/
      sec = $2 ? $2.to_i * 3600 : 0
      NSTimeZone.timeZoneForSecondsFromGMT(sec)
    else
      NSTimeZone.timeZoneWithName(self)
    end
  end

end
