class CompaniesController < ApiController
    before_action :set_company, only: [:show]
    # GET /companies
    def index
        if params[:name] != nil && params[:symbol] == nil
            @companies = Company.where("name like ?", "%#{params[:name]}%")
        elsif params[:symbol] != nil && params[:name] == nil
            @companies = Company.where("symbol like ?", "%#{params[:symbol]}%")
        elsif params[:symbol] != nil && params[:name] != nil
            @companies = Company.where("symbol like ? and name like ?", "%#{params[:symbol]}%", "%#{params[:name]}%")
        else
            @companies = Company.all
        end
        render json: @companies
    end
    # GET /companies/1
    def show
        render json: @company
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
        @company = Company.find(params[:id])
    end
    # Only allow a trusted parameters
    def company_params
        params.require(:company).permit(:name, :symbol)
    end
end