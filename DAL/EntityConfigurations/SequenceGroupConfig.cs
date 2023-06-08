﻿
using GptApiTest.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LangSequenseTraining.DAL.EntityConfigurations
{
    internal class SequenceGroupConfig : IEntityTypeConfiguration<SequenceGroup>
    {
        public void Configure(EntityTypeBuilder<SequenceGroup> builder)
        {
            builder.Property(x => x.Id);
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name).IsUnicode(true);
        }
    }
}