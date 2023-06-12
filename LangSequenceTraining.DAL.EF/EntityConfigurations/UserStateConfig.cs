
using LangSequenceTraining.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenceTraining.DAL
{
    internal class UserStateConfig : IEntityTypeConfiguration<UserState>
    {
        public void Configure(EntityTypeBuilder<UserState> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);
            builder.HasOne(x => x.User)
                .WithMany().HasForeignKey(x => x.UserId);
            builder.Property(x => x.State);

            builder.HasIndex(u => u.UserId).IsUnique();

        }
    }
}
