using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    [Table("product_variant")]
    public class ProductVariant
    {
        [Column("ProductVariantId")]
        public Guid id { get; set; }
        public string Info { get; set; }
        public double Price { get; set; }

        [ForeignKey(nameof(Product))]
        public Guid ProductId { get; set; }
        public Product? Product { get; set; }

    }
}
