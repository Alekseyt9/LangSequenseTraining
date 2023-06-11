
using LangSequenceTraining.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL
{
    internal class UserConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);
            builder.Property(x => x.Name).IsUnicode(true);
        }
    }
}
