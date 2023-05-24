
using GptApiTest.Entity;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace LangSequenseTraining.DAL.EntityConfigurations
{
    internal class SequenseConfig : IEntityTypeConfiguration<Sequense>
    {
        public void Configure(EntityTypeBuilder<Sequense> builder)
        {
            builder.Property(x => x.Id);
        }
    }
}
