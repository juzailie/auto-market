using Entities.Dto;
using Entities.Models;

namespace AutoMarketApi
{
    public class AutoMapperConfig : AutoMapper.Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<Product, ProductDto>();
            CreateMap<ProductVariant, ProductVariantDto>();
        }
    }
}
