class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to goals_path
    end

    @examples = [
      'run <span>300</span> miles',
      'take my dog hiking <span>25</span> times',
      'do <span>10</span> good deeds',
      'will go to the gym <span>150</span> times',
      'save <span>3000</span> dollars',
      'use <span>500</span> dollars worth of coupons',
      'watch <span>12</span> documentaries',
      'read <span>14</span> books',
      'read <span>2200</span> pages of books',
      'paint <span>20</span> paintings',
      'write in my diary <span>300</span> times',
      'volunteer <span>15</span> times',
      'cook <span>10</span> meals for others',
      'see live entertainment <span>28</span> times',
      'host <span>8</span> parties',
      'bikes <span>600</span> miles',
      'swim <span>20000</span> laps',
      'bike to work <span>35</span> times',
      'write <span>15</span> songs',
      'sell <span>20</span> things from my overfilling attic',
      'opt to shop locally instead of at a big box store <span>15</span> times',
      'cook instead of eating out <span>16</span> times',
      'donate to charity <span>12</span> times',
      'write <span>18</span> hand written letters',
      'contribute to <span>20</span> open source projects',
      'lose <span>40</span> pounds',
      'contribute to <span>6</span> kickstarter projects',
      'buy my wife/husband flowers <span>12</span> times'
    ].shuffle
  end

  def privacy_policy
  end
end
