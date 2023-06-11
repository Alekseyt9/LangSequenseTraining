
using LangSequenceTraining.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL
{
    internal class UserSequenceProgressConfig : IEntityTypeConfiguration<UserSequenceProgress>
    {
        public void Configure(EntityTypeBuilder<UserSequenceProgress> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.HasOne(x => x.User)
                .WithMany().HasForeignKey(x => x.UserId);
            builder.HasOne(x => x.Sequence)
                .WithMany().HasForeignKey(x => x.SequenseId);

            builder.Property(x => x.StartTime).IsRequired();
            builder.Property(x => x.LastUpdateTime);
            builder.Property(x => x.LastSuccessTime);
            builder.Property(x => x.Stage);
        }
    }
}
