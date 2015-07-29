class Userinfo
  constructor: (birthday) ->
    @year = birthday.substr(0, 4)
    @monthDate = birthday.substr(4, 4)
    @ChineseZodiac = @getChineseZodiac parseInt @year
    @zodiac = @getZodiac parseInt @monthDate

  getChineseZodiac: (year) ->
    step = year % 12
    chineseZodiac = switch
      when step == 0 then "원숭이"
      when step == 1 then "닭"
      when step == 2 then "개"
      when step == 3 then "돼지"
      when step == 4 then "쥐"
      when step == 5 then "소"
      when step == 6 then "호랑이"
      when step == 7 then "토끼"
      when step == 8 then "용"
      when step == 9 then "뱀"
      when step == 10 then "말"
      when step == 11 then "양"
    return chineseZodiac + "띠"

  getZodiac: (monthDate) ->
    zodiac = switch
      when monthDate < 120 then "염소"
      when monthDate < 219 then "물병"
      when monthDate < 321 then "물고기"
      when monthDate < 421 then "양"
      when monthDate < 521 then "황소"
      when monthDate < 622 then "쌍둥이"
      when monthDate < 723 then "게"
      when monthDate < 823 then "사자"
      when monthDate < 923 then "처녀"
      when monthDate < 1022 then "천칭"
      when monthDate < 1121 then "전갈"
      when monthDate < 1222 then "사수"
      else "염소"
    return zodiac + "자리"

class Zodiac
  constructor: (birthday) ->
    @returnObject = {}
    date = birthday + ''
    validation = ///
      ^(19|20)\d\d
      (0[1-9]|1[012])
      (0[1-9]|[12][0-9]|3[01])
      ///
    if date.match validation
      @returnObject = new Userinfo(date)
    else
      @errMessage("생년월일의 입력 형식이 잘못되었습니다", "YYYYMMDD 형식으로 입력해 주세요")

    return @returnObject

  errMessage: (msg, description) ->
    @returnObject.err = msg
    @returnObject.message = description

module.exports = Zodiac
