import SwiftUI

struct FindMyIPView: View {
    @ObservedObject var viewModel = FindMyIPViewModel()
    var body: some View {
            VStack{
                if viewModel.isLoading{
                    ProgressView()
                }else{
                    List{
                        bindingData(name: "IP : ", value: viewModel.findMyIPModel?.ip ?? "")
                        bindingData(name: "Network : ", value: viewModel.findMyIPModel?.network ?? "")
                        bindingData(name: "Version : ", value: viewModel.findMyIPModel?.version ?? "")
                        bindingData(name: "City : ", value: viewModel.findMyIPModel?.city ?? "")
                        bindingData(name: "Region : ", value: viewModel.findMyIPModel?.region ?? "")
                        bindingData(name: "Region_code : ", value: viewModel.findMyIPModel?.region_code ?? "")
                        bindingData(name: "Country : ", value: viewModel.findMyIPModel?.country ?? "")
                        bindingData(name: "Country_name : ", value: viewModel.findMyIPModel?.country_name ?? "")
                        bindingData(name: "Country_code : ", value: viewModel.findMyIPModel?.country_code ?? "")
                        bindingData(name: "Country_code_iso3 : ", value: viewModel.findMyIPModel?.country_code_iso3 ?? "")
                        bindingData(name: "Country_capital : ", value: viewModel.findMyIPModel?.country_capital ?? "")
                        bindingData(name: "Country_tld : ", value: viewModel.findMyIPModel?.country_tld ?? "")
                        bindingData(name: "Continent_code : ", value: viewModel.findMyIPModel?.continent_code ?? "")
                        bindingData(name: "In_eu : ", value: "\(viewModel.findMyIPModel?.in_eu ?? false ? "true":"false")")
                        bindingData(name: "Postal : ", value: viewModel.findMyIPModel?.postal ?? "")
                        bindingData(name: "Postal : ", value: viewModel.findMyIPModel?.postal ?? "")
                        bindingData(name: "Latitude : ", value: "\(viewModel.findMyIPModel?.latitude ?? 0.0)")
                        bindingData(name: "Longitude : ", value: "\(viewModel.findMyIPModel?.longitude ?? 0.0)")
                        bindingData(name: "Timezone : ", value: viewModel.findMyIPModel?.timezone ?? "")
                        bindingData(name: "Utc_offset : ", value: viewModel.findMyIPModel?.utc_offset ?? "")
                        bindingData(name: "Country_calling_code : ", value: viewModel.findMyIPModel?.country_calling_code ?? "")
                        bindingData(name: "Currency : ", value: viewModel.findMyIPModel?.currency ?? "")
                        bindingData(name: "Currency_name : ", value: viewModel.findMyIPModel?.currency_name ?? "")
                        bindingData(name: "Languages : ", value: viewModel.findMyIPModel?.languages ?? "")
                        bindingData(name: "Country_area : ", value: "\(viewModel.findMyIPModel?.country_area ?? 0.0)")
                        bindingData(name: "Country_population : ", value: "\(viewModel.findMyIPModel?.country_population ?? 0)")
                        bindingData(name: "asn : ", value: viewModel.findMyIPModel?.asn ?? "")
                        bindingData(name: "org : ", value: viewModel.findMyIPModel?.org ?? "")
                    }
                }
                
            }.onAppear(){
                viewModel.findMyIPData()
            }
        }
    
    func bindingData(name:String,value:String) -> some View{
       return HStack{
            Text(name)
                .bold()
            Text(value)
        }
    }
    }


#Preview {
    FindMyIPView()
}
