
using LangSequenseTraining.DAL.EntityConfigurations;
using Microsoft.EntityFrameworkCore;

namespace LangSequenceTraining.DAL.Services
{
    internal class AppDbContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new SequenceConfig());
            modelBuilder.ApplyConfiguration(new SequenceGroupConfig());
            modelBuilder.ApplyConfiguration(new UserConfig());
            modelBuilder.ApplyConfiguration(new UserSequenceProgressConfig());

            base.OnModelCreating(modelBuilder);
        }

    }
}
