class AnalyticsController < ApplicationController
  def index
    session_id = session.id.to_s

    @user_recent_searches = Search.where(session_id: session_id)
                                  .where('created_at > ?', 1.hour.ago)
                                  .order(created_at: :desc)

    @user_specific_searches = user_specific_searches(session_id)

    @all_time_popular_searches = calculate_popularity
    @trending_searches_today = trending_searches(Time.zone.now.beginning_of_day)
    @trending_searches_this_week = trending_searches(Time.zone.now.beginning_of_week)
    @trending_searches_this_month = trending_searches(Time.zone.now.beginning_of_month)

    @all_time_popular_questions = calculate_popularity(true)
    @word_frequency = word_frequency

    @unique_user_count = Search.select(:session_id).distinct.count
  end

  private

  def calculate_popularity(is_question = false)
    phrase_counts = Hash.new(0)
    scope = is_question ? Search.where('input ILIKE ?', 'who%') : Search.all

    scope.find_each do |search|
      phrase_counts[search.input] += 1
    end

    phrase_counts.sort_by { |_phrase, count| -count }
  end

  def user_specific_searches(session_id)
    Search.where(session_id: session_id)
          .group(:input)
          .order('COUNT(input) DESC')
          .count
  end

  def trending_searches(start_time)
    Search.where('created_at > ?', start_time)
          .group(:input)
          .order('COUNT(input) DESC')
          .limit(10)
          .count
  end

  def word_frequency
    word_counts = Hash.new(0)
    stop_words = ['the', 'and', 'is', 'a', 'to', 'in', 'for', 'of', 'on', 'that', 'by', 'with', 'as', 'this', 'it', 'are', 'was', 'be', 'at', 'or', 'an', 'if', 'from', 'but', 'not']

    Search.find_each do |search|
      words = search.input.downcase.split(/\W+/) - stop_words
      words.each { |word| word_counts[word] += 1 unless word.empty? }
    end

    word_counts.sort_by { |_word, count| -count }.first(20)
  end
end
