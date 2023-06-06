
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
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Text).IsUnicode(true);
            builder.Property(x => x.Description);
        }
    }
}
