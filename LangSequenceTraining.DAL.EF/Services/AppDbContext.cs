
using LangSequenceTraining.DAL.EF.EntityConfigurations;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Tests;
using LangSequenseTraining.DAL;
using Microsoft.EntityFrameworkCore;

namespace LangSequenceTraining.DAL.Services
{
    public class AppDbContext : DbContext
    {

        public DbSet<User> Users { get; set; }

        public DbSet<Sequence> Sequences { get; set; }

        public DbSet<SequenceGroup> SequenceGroup { get; set; }

        public DbSet<UserSequenceProgress> UserSequenceProgress { get; set; }

        public DbSet<UserState> UserState { get; set; }

        public DbSet<TimeTest> TimeTest { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new SequenceConfig());
            modelBuilder.ApplyConfiguration(new SequenceGroupConfig());
            modelBuilder.ApplyConfiguration(new UserConfig());
            modelBuilder.ApplyConfiguration(new UserSequenceProgressConfig());
            modelBuilder.ApplyConfiguration(new UserStateConfig());

            modelBuilder.ApplyConfiguration(new TimeTestConfig());

            base.OnModelCreating(modelBuilder);
        }

    }
}
