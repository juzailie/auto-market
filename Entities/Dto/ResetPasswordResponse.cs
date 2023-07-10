using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dto
{
    public class ResetPasswordResponse
    {
        public bool status { get; set; }
        public string temporarypassword { get; set; }
    }
}
