using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dto
{
    public class LoginResultDto
    {
        public string id { get; set; }
        public bool status { get; set; }
        public string username { get; set; }
    }
}
