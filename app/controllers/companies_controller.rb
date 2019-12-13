class CompaniesController < ApiController
    before_action :set_company, only: [:show, :history]
    # GET /companies
    def index
        if params[:name] != nil
            @companies = Company.where("symbol like ? or name like ?", "%#{params[:name]}%", "%#{params[:name]}%")
        else
            @companies = Company.all
        end
        
        @companies = @companies.order :name

        render json: @companies
    end
    
    # GET /companies/1
    def show
        render json:@company
    end

    # GET /companies/:id/history
    def history
        
        url = 'https://cloud.iexapis.com/stable/stock/'
        url << @company.symbol.sub("^","-")
        url << '/chart/1m/?token=pk_73fb351034574773a81b041dc69eb111'

        response = RestClient::Request.execute(
            method: :get,
            url: url
        )
        
        data = JSON.parse(response.body)

        history = []
        data.each do |item|            
            history << { 
                    x: Date.parse(item['date']).to_time.to_i*1000,
                    open: item['open'],
                    high: item['high'],
                    low: item['low'],
                    close: item['close']            
                }
        end
                       
        render json: { 
            company: @company,
            history: history           
        }.to_json
    end
    
    private
    
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
        params.require(:company).permit(:name, :symbol)
    end
end