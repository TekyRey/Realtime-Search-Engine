class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update destroy]

  def index
    if params[:query].present?
      session_id = session.id.to_s
      user_session = UserSession.find_or_create_by(session_id: session_id)

      sanitized_query = params[:query].gsub(/[^0-9A-Za-z]/, ' ').strip
      @articles = Article.where("title ILIKE :query OR content ILIKE :query", query: "%#{sanitized_query}%")

      if should_save_search?(user_session, sanitized_query)
        user_session.update(last_search: sanitized_query, last_search_time: Time.now)
        save_search_after_delay(user_session, sanitized_query)
      end
      sanitized_query.split.each do |word|
        next if word.length <= 2
        analytic = Analytic.find_or_initialize_by(word: word.downcase)
        analytic.count += 1
        analytic.save
      end
    else
      @articles = Article.all
    end
  end 

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        # format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        # format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end

    def should_save_search?(user_session, query)
      last_search = user_session.last_search || ''
      time_since_last_search = user_session.last_search_time ? Time.now - user_session.last_search_time : Float::INFINITY
      query.length > 3 && (query != last_search || time_since_last_search > 10.seconds)
    end

    def save_search_after_delay(user_session, query)
      delay_time = 3.seconds  # Adjust the delay time as needed.
      Thread.new do
        sleep(delay_time)  # Wait for the specified delay time.
        if user_session.reload.last_search == query
          # If the last search is still this query, save it.
          Search.create(input: query, session_id: user_session.session_id)
        end
      end
    end
end
