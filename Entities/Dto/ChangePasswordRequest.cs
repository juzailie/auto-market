using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dto
{
    public class ChangePasswordRequest
    {
        public string currentpassword { get; set; }
        public string newpassword { get; set; }
        public string comfirmpassword { get; set; }
    }
}
