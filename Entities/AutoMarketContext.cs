using Entities.Models;
using Microsoft.EntityFrameworkCore;

namespace Entities
{
    public class AutoMarketContext : DbContext
    {
        public AutoMarketContext()  { }
        public AutoMarketContext(DbContextOptions<AutoMarketContext> options) : base(options) { }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("server=localhost;port=3306;user=root;password=_Password001;database=automarket");
            }
        }
        public DbSet<Product>? Products { get; set; }
        public DbSet<ProductVariant>? ProductVariants { get; set; }
        public DbSet<User>? Accounts { get; set; }
    }
}