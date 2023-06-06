
using GptApiTest.Entity;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL.EntityConfigurations
{
    internal class UserSequenseProgressConfig
    {
        public void Configure(EntityTypeBuilder<UserSequenseProgress> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name).IsUnicode(true);
        }
    }
}
