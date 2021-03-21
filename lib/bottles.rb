class Bottles
  MAX_BOTTLES = 99

  def song()
    verses(99, 0)
  end

  def verses(initialNumOfBottles, finalNumOfBottles)
    return initialNumOfBottles.downto(finalNumOfBottles)
                              .map { |numOfBottles| verse(numOfBottles) }
                              .join("\n")
  end

  def verse(numOfBottles)
    line1 = Verse.new.lineTemplate("#{getBottlesOfBeer(numOfBottles)} #{getLocation()}", getBottlesOfBeer(numOfBottles))
    line2 = Verse.new.lineTemplate("#{getActionLine(numOfBottles)}", "#{getBottlesOfBeer(countBottlesLeft(numOfBottles))} #{getLocation()}")

    return Verse.new.verseTemplate(line1, line2)
  end

  def getBottlesOfBeer(numOfBottles)
    case numOfBottles
    when 0
      return "no more bottles of beer"
    when 1
      return "1 bottle of beer"
    else
      return "#{numOfBottles} bottles of beer"
    end
  end

  def getLocation()
    return "on the wall"
  end

  def getActionLine(numOfBottles)
    case numOfBottles
    when 0
      return "go to the store and buy some more"
    when 1
       return "take it down and pass it around"
    else
      return "take one down and pass it around"
    end
  end

  def countBottlesLeft(numOfBottles)
    if numOfBottles == 0
      numOfBottles = MAX_BOTTLES
    else
      numOfBottles -= 1
    end

    return numOfBottles
  end
end

class Verse
  def lineTemplate(part1, part2)
    return "#{part1}, #{part2}.\n"
  end

  def verseTemplate(line1, line2)
    return line1.capitalize + line2.capitalize
  end
end
