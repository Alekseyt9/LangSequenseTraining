
using GptApiTest.Entity;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL.EntityConfigurations
{
    internal class UserConfig
    {
        public void Configure(EntityTypeBuilder<SequenceGroup> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name).IsUnicode(true);
        }
    }
}
