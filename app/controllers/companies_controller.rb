class CompaniesController < ApiController
    before_action :set_company, only: [:show, :history]
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
        render json:@company
    end

    # GET /companies/:id/history
    def history
        # API Token: pk_2949e1678ef0494b9dbc13eafbf24b60 
        # Account No. ab3d8040e21beeeb8c909d586b332245 

        url = 'https://cloud.iexapis.com/stable/stock/'
        url << @company.symbol
        url << '/chart/1mm/?token=pk_2949e1678ef0494b9dbc13eafbf24b60'

        response = RestClient::Request.execute(
            method: :get,
            url: url
        )

        render json:response
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