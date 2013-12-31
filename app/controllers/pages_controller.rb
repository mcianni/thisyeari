class PagesController < ApplicationController

  def home
    @examples = [
      'run x miles',
      'take my dog hiking x times',
      'do x good deeds',
      'will go to the gym x times',
      'save x dollars',
      'use x dollars worth of coupons',
      'watch x documentaries',
      'read x books',
      'read x pages of books',
      'paint x paintings',
      'write in my diary x times',
      'volunteer x times',
      'cook x meals for others',
      'see live entertainment x times',
      'host x parties',
      'bikes x miles',
      'swim x laps',
      'bike to work x times',
      'write x songs',
      'sell x things from my overfilling attic',
      'opt to shop locally instead of at a big box store x times',
      'cook instead of eating out x times',
      'donate to charity x times',
      'write x hand written letters',
      'contribute to x open source projects',
      'lose x pounds',
      'contribute to x kickstarter projects',
      'buy my wife/husband flowers x times'
    ]
  end

end
