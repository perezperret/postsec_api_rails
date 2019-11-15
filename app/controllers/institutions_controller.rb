class InstitutionsController < ApplicationController
  def index
    render json: {
      institutions: serialized_institutions,
      page: params[:page] || 1,
      per_page: Institution::PER_PAGE
    }
  end

  private

  def serialized_institutions
    institutions.map { |i| i.as_json except: %i[created_at updated_at] }
  end

  def institutions
    query = params[:query]
    result = if query.present?
               Institution.search query
             else
               Institution.all
             end

    result.page(params[:page])
  end
end
