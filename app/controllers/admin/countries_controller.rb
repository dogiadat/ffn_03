class Admin::CountriesController < Admin::BaseController
  def new
    @countries = Country.all
    @country = Country.new
  end

  def create
    @country = Country.new country_params
    if @country.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to new_admin_country_url
  end

  private

  def country_params
    params[:country][:name] = country_name params[:country][:code]
    params.require(:country).permit :name, :code
  end

  def country_name name
    country = ISO3166::Country[name]
    name = country.translations[I18n.locale.to_s] || country.name
  end
end
