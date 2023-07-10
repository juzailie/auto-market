using Entities;
using Entities.Dto;
using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using NuGet.DependencyResolver;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AutoMarketApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly AutoMarketContext _context;

        public AuthController(AutoMarketContext context)
        {
            _context = context;
        }

        [HttpPost]
        public ActionResult<LoginResultDto> Post(LoginRequestDto value)
        {
            LoginResultDto result = new LoginResultDto() { id = Guid.Empty.ToString(), status = false };

            User accountRecord = _context.Accounts.FirstOrDefault(x => x.username == value.username && x.password == value.password);

            if(accountRecord != null)
            {
                result.status = true;
                result.id = accountRecord.id.ToString();
                result.username = accountRecord.username;
            }

            return result;
        }

    }
}
