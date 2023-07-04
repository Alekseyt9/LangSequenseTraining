
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using LangSequenceTraining.Model.Tests;
using Microsoft.EntityFrameworkCore;

namespace LangSequenceTraining.DAL.EF.EntityConfigurations
{
    internal class TimeTestConfig : IEntityTypeConfiguration<TimeTest>
    {
        public void Configure(EntityTypeBuilder<TimeTest> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Time);
        }

    }
}
