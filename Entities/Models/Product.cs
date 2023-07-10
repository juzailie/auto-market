using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    [Table("product")]
    public class Product
    {
        [Column("ProductId")]
        public Guid id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public ICollection<ProductVariant>? ProductVariants { get; set; }

    }
}
