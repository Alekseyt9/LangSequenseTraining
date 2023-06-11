
using LangSequenceTraining.Model;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace LangSequenseTraining.DAL
{
    internal class SequenceConfig : IEntityTypeConfiguration<Sequence>
    {
        public void Configure(EntityTypeBuilder<Sequence> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Text).IsUnicode(true);
            builder.Property(x => x.Description);
            builder.Property(x => x.Order);

            builder.HasOne(x => x.SequenceGroup)
                .WithMany().HasForeignKey(x => x.SequenceGroupId);
        }
    }
}
