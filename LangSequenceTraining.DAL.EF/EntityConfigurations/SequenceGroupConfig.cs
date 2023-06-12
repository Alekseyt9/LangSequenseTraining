
using LangSequenceTraining.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL
{
    internal class SequenceGroupConfig : IEntityTypeConfiguration<SequenceGroup>
    {
        public void Configure(EntityTypeBuilder<SequenceGroup> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name).IsUnicode(true);
            builder.Property(x => x.Description);
            builder.Property(x => x.IsHide);
            builder.Property(x => x.Order);
        }
    }
}
