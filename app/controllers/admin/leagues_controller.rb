class Admin::LeaguesController < Admin::BaseController

  def index
    @leagues = League.order(created_at: :desc)
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new league_params
    @league.save
    redirect_to admin_leagues_url
  end

  private
  def league_params
    params.require(:league).permit :name, :country_id
  end

  def country_name name
    country = ISO3166::Country[name]
    country.translations[I18n.locale.to_s] || country.name
  end
end
